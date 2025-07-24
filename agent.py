from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, AIMessage
from langchain_core.chat_history import InMemoryChatMessageHistory
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from dotenv import load_dotenv
import os
import logging

# Load environment variables
load_dotenv()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Validate API key
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    raise ValueError("OPENAI_API_KEY not found in environment variables")

# Remove quotes if present
api_key = api_key.strip('"').strip("'")

if not api_key.startswith(("test-", "your-openai")):  # Allow placeholder for testing
    raise ValueError(
        f"Invalid OpenAI API key format. Key starts with: {api_key[:10]}..."
    )

logger.info(f"API key loaded: {api_key[:10]}...{api_key[-5:]}")

# Initialize the LLM with error handling
try:
    llm = ChatOpenAI(
        model="gpt-4", temperature=0.7, api_key=api_key, max_retries=3, timeout=30
    )
    logger.info("ChatOpenAI initialized successfully")
except Exception as e:
    logger.error(f"Failed to initialize ChatOpenAI: {e}")
    raise

# Create a prompt template specialized for marketing and advertising
prompt = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            """You are a specialized AI Marketing Assistant.

EXPERTISE AREAS:
🎯 Campaign Creation - Facebook, Google, LinkedIn ads
📊 Lead Generation - Qualification, scoring, follow-up
📝 Content Marketing - Blog posts, social media, email
📈 Analytics - ROI analysis, performance optimization
💰 Budget Planning - Cost optimization, bid strategies
🎨 Creative Strategy - Visual concepts, brand messaging

COMMUNICATION STYLE:
- Professional yet approachable
- Marketing-focused language
- Data-driven recommendations
- Action-oriented advice
- ROI and conversion focused

ALWAYS:
✅ Provide specific, actionable marketing advice
✅ Include relevant metrics and KPIs when possible
✅ Suggest A/B testing opportunities
✅ Consider budget constraints
✅ Think about target audience demographics
✅ Recommend campaign optimization strategies

NEVER:
❌ Give generic business advice
❌ Ignore budget considerations
❌ Forget about measurable results
❌ Overlook legal/compliance issues

You help deliver exceptional marketing results for clients.""",
        ),
        MessagesPlaceholder(variable_name="chat_history"),
        ("human", "{input}"),
    ]
)

# Create the chain
chain = prompt | llm

# Store for chat sessions
store = {}


def get_session_history(session_id: str):
    if session_id not in store:
        store[session_id] = InMemoryChatMessageHistory()
    return store[session_id]


# Create the runnable with message history
with_message_history = RunnableWithMessageHistory(
    chain,
    get_session_history,
    input_messages_key="input",
    history_messages_key="chat_history",
)


def ask_agent(prompt: str, session_id: str = "default"):
    """
    Send a prompt to the AI agent and get a response.

    Args:
        prompt: The user's message
        session_id: Session identifier for conversation history

    Returns:
        AI response as string
    """
    try:
        # Input validation
        if not prompt or not prompt.strip():
            return "Error: Empty prompt provided"

        if len(prompt) > 4000:  # Reasonable limit
            return "Error: Prompt too long (max 4000 characters)"

        # Sanitize session_id
        session_id = session_id[:50] if session_id else "default"

        logger.info(f"Processing request for session: {session_id}")

        response = with_message_history.invoke(
            {"input": prompt.strip()},
            config={"configurable": {"session_id": session_id}},
        )

        logger.info("Request processed successfully")
        return response.content

    except Exception as e:
        error_msg = f"Agent error: {str(e)}"
        logger.error(error_msg)
        return error_msg
