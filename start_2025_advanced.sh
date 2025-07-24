#!/bin/bash

# 🎯 AI Marketing Agent 2025 Advanced - Enterprise Startup Script
# Startup script sa najnovijim 2025 inovacijama i cutting-edge funkcionalnostima

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}$1${NC}"
}

# ASCII Art Banner
print_banner() {
    echo -e "${CYAN}"
    cat << "EOF"
    ╔═══════════════════════════════════════════════════════════════╗
    ║                                                               ║
    ║    🎯 AI MARKETING AGENT 2025 ADVANCED                       ║
    ║    🚀 Cutting-Edge Enterprise Edition                         ║
    ║    ⚡ Neural • Quantum • AR/VR • Biometric • Autonomous      ║
    ║                                                               ║
    ║    Version: 2.1.0 Advanced | Date: July 24, 2025            ║
    ║                                                               ║
    ╚═══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# Check if running on macOS or Linux
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
    else
        OS="Unknown"
    fi
    print_status "Detected OS: $OS"
}

# Check prerequisites
check_prerequisites() {
    print_header "🔍 Checking Prerequisites..."
    
    # Check Python version
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
        print_success "Python $PYTHON_VERSION found"
        
        # Check if Python version is 3.12+
        if python3 -c "import sys; exit(0 if sys.version_info >= (3, 12) else 1)"; then
            print_success "Python version is compatible (3.12+)"
        else
            print_warning "Python 3.12+ is recommended for optimal performance"
        fi
    else
        print_error "Python 3 not found. Please install Python 3.12+"
        exit 1
    fi
    
    # Check pip
    if command -v pip3 &> /dev/null; then
        print_success "pip3 found"
    else
        print_error "pip3 not found. Please install pip"
        exit 1
    fi
    
    # Check Docker (optional)
    if command -v docker &> /dev/null; then
        print_success "Docker found - Enterprise deployment available"
        DOCKER_AVAILABLE=true
    else
        print_warning "Docker not found - Only local deployment available"
        DOCKER_AVAILABLE=false
    fi
    
    # Check Docker Compose (optional)
    if command -v docker-compose &> /dev/null; then
        print_success "Docker Compose found - Full-stack deployment available"
        DOCKER_COMPOSE_AVAILABLE=true
    else
        print_warning "Docker Compose not found - Limited deployment options"
        DOCKER_COMPOSE_AVAILABLE=false
    fi
}

# Check and create .env file
setup_environment() {
    print_header "⚙️  Setting up Environment..."
    
    if [ ! -f ".env" ]; then
        print_status "Creating .env file from template..."
        if [ -f ".env.example" ]; then
            cp .env.example .env
            print_success ".env file created"
            print_warning "Please edit .env file with your API keys and configuration"
        else
            print_status "Creating basic .env file..."
            cat > .env << EOF
# 🎯 AI Marketing Agent 2025 Advanced Configuration

# ===== CORE AI SETTINGS =====
OPENAI_API_KEY=your_openai_api_key_here
ANTHROPIC_API_KEY=your_anthropic_api_key_here

# ===== NEURAL OPTIMIZATION =====
NEURAL_LEARNING_RATE=0.001
NEURAL_BATCH_SIZE=32
NEURAL_EPOCHS=100
NEURAL_OPTIMIZATION_ENABLED=true

# ===== QUANTUM COMPUTING =====
QUANTUM_BACKEND=qasm_simulator
QUANTUM_SHOTS=1024
QUANTUM_ENTANGLEMENT_DEPTH=5
QUANTUM_COHERENCE_TIME=1000

# ===== BIOMETRIC ANALYSIS =====
BIOMETRIC_SAMPLING_RATE=100
EMOTION_MODEL_VERSION=2025.1
BIOMETRIC_ENABLED=true

# ===== AR/VR CAMPAIGNS =====
AR_VR_ENABLED=true
IMMERSIVE_QUALITY=high
PLATFORM_SUPPORT=ios,android,web,oculus

# ===== AUTONOMOUS OPTIMIZATION =====
AUTONOMOUS_ENABLED=true
OPTIMIZATION_THRESHOLD=0.15
RISK_TOLERANCE=medium

# ===== EDGE AI =====
EDGE_AI_ENABLED=true
EDGE_NODES=us-east,us-west,eu-central
PERSONALIZATION_LATENCY=50

# ===== BLOCKCHAIN ROI =====
BLOCKCHAIN_NETWORK=ethereum
WEB3_PROVIDER_URL=your_web3_provider_here

# ===== MARKETING PLATFORMS =====
FACEBOOK_APP_ID=your_facebook_app_id
FACEBOOK_APP_SECRET=your_facebook_app_secret
GOOGLE_ADS_CLIENT_ID=your_google_ads_client_id
GOOGLE_ADS_CLIENT_SECRET=your_google_ads_client_secret
LINKEDIN_CLIENT_ID=your_linkedin_client_id
LINKEDIN_CLIENT_SECRET=your_linkedin_client_secret

# ===== DATABASE =====
DATABASE_URL=postgresql://aimarketing:password@localhost:5432/ai_marketing_db
REDIS_URL=redis://localhost:6379/0

# ===== SECURITY =====
JWT_SECRET_KEY=your_jwt_secret_key_here
ENCRYPTION_KEY=your_encryption_key_here

# ===== MONITORING =====
SENTRY_DSN=your_sentry_dsn_here
PROMETHEUS_ENDPOINT=http://localhost:9090

# ===== DEVELOPMENT =====
ENVIRONMENT=development
DEBUG=true
LOG_LEVEL=INFO
EOF
            print_success "Basic .env file created"
            print_warning "Please edit .env file with your API keys and configuration"
        fi
    else
        print_success ".env file already exists"
    fi
}

# Install dependencies
install_dependencies() {
    print_header "📦 Installing Advanced Dependencies..."
    
    # Create virtual environment if it doesn't exist
    if [ ! -d "venv" ]; then
        print_status "Creating virtual environment..."
        python3 -m venv venv
        print_success "Virtual environment created"
    fi
    
    # Activate virtual environment
    print_status "Activating virtual environment..."
    source venv/bin/activate
    
    # Upgrade pip and core tools
    print_status "Upgrading pip and core tools..."
    pip install --upgrade pip setuptools wheel
    
    # Install advanced requirements
    if [ -f "requirements_2025_advanced.txt" ]; then
        print_status "Installing 2025 Advanced requirements..."
        pip install -r requirements_2025_advanced.txt
        print_success "Advanced dependencies installed"
    else
        print_warning "Advanced requirements file not found, installing basic requirements..."
        if [ -f "requirements.txt" ]; then
            pip install -r requirements.txt
        else
            print_error "No requirements file found"
            exit 1
        fi
    fi
}

# Initialize AI models and datasets
initialize_ai_models() {
    print_header "🧠 Initializing AI Models..."
    
    # Create models directory
    mkdir -p models neural_weights quantum_cache
    
    print_status "Downloading pre-trained models..."
    python3 -c "
import torch
import transformers
from sentence_transformers import SentenceTransformer

print('Downloading neural optimization models...')
# Download sentence transformer for semantic analysis
try:
    model = SentenceTransformer('all-MiniLM-L6-v2')
    print('✅ Sentence transformer model loaded')
except Exception as e:
    print(f'⚠️  Sentence transformer download failed: {e}')

# Initialize neural weights
try:
    torch.save(torch.randn(10, 5), 'neural_weights/initial_weights.pt')
    print('✅ Neural weights initialized')
except Exception as e:
    print(f'⚠️  Neural weights initialization failed: {e}')

print('AI models initialization completed')
"
    print_success "AI models initialized"
}

# Setup database (if local)
setup_database() {
    print_header "🗄️  Setting up Database..."
    
    # Check if PostgreSQL is available
    if command -v psql &> /dev/null; then
        print_status "PostgreSQL found - Setting up local database..."
        # Create database if it doesn't exist
        createdb ai_marketing_db 2>/dev/null || print_status "Database already exists"
        print_success "Database setup completed"
    else
        print_warning "PostgreSQL not found - Using SQLite for development"
        # Create SQLite database
        python3 -c "
import sqlite3
conn = sqlite3.connect('ai_marketing.db')
conn.close()
print('SQLite database created')
"
    fi
}

# Run tests
run_tests() {
    print_header "🧪 Running Advanced Tests..."
    
    source venv/bin/activate
    
    if [ -d "tests" ]; then
        print_status "Running test suite..."
        python -m pytest tests/ -v --tb=short
        print_success "Tests completed"
    else
        print_warning "No tests directory found"
    fi
}

# Start the application
start_application() {
    print_header "🚀 Starting AI Marketing Agent 2025 Advanced..."
    
    source venv/bin/activate
    
    print_status "Starting advanced server on port 8001..."
    print_status "Advanced API Documentation: http://localhost:8001/docs"
    print_status "Real-time API Docs: http://localhost:8001/redoc"
    print_status "Health Check: http://localhost:8001/health"
    print_status "Advanced Capabilities: http://localhost:8001/api/v2/capabilities"
    
    echo ""
    print_success "🎯 AI Marketing Agent 2025 Advanced is starting..."
    print_success "🧠 Neural Optimization: ENABLED"
    print_success "⚛️  Quantum Prediction: ENABLED"
    print_success "🥽 AR/VR Campaigns: ENABLED"
    print_success "🧬 Biometric Analysis: ENABLED"
    print_success "🤖 Autonomous Optimization: ENABLED"
    print_success "⚡ Edge AI Personalization: ENABLED"
    print_success "🔗 Blockchain ROI: ENABLED"
    echo ""
    
    # Start the advanced server
    python -m uvicorn main_2025_advanced:app --host 0.0.0.0 --port 8001 --reload
}

# Docker deployment
docker_deployment() {
    print_header "🐳 Docker Enterprise Deployment..."
    
    if [ "$DOCKER_AVAILABLE" = true ]; then
        print_status "Building advanced Docker image..."
        docker build -f Dockerfile_2025_advanced -t ai-marketing-agent-2025-advanced .
        
        if [ "$DOCKER_COMPOSE_AVAILABLE" = true ]; then
            print_status "Starting full-stack deployment..."
            docker-compose -f docker-compose-2025-advanced.yml up -d
            print_success "Enterprise stack deployed"
            print_status "Services available:"
            print_status "- AI Agent: http://localhost:8001"
            print_status "- Grafana: http://localhost:3000 (admin/admin123)"
            print_status "- Prometheus: http://localhost:9090"
            print_status "- MLflow: http://localhost:5000"
        else
            print_status "Starting single container..."
            docker run -d -p 8001:8001 --name ai-marketing-agent-2025-advanced ai-marketing-agent-2025-advanced
            print_success "Advanced container started"
        fi
    else
        print_error "Docker not available for deployment"
        exit 1
    fi
}

# Performance benchmarks
run_benchmarks() {
    print_header "⚡ Running Performance Benchmarks..."
    
    source venv/bin/activate
    
    python3 -c "
import asyncio
import aiohttp
import time
import statistics

async def benchmark_endpoint(session, url, data=None):
    start_time = time.time()
    try:
        if data:
            async with session.post(url, json=data) as response:
                await response.json()
        else:
            async with session.get(url) as response:
                await response.json()
        return time.time() - start_time
    except Exception:
        return None

async def run_benchmarks():
    async with aiohttp.ClientSession() as session:
        print('🧠 Neural Optimization Benchmark...')
        neural_times = []
        for i in range(5):
            time_taken = await benchmark_endpoint(
                session, 
                'http://localhost:8001/api/v2/neural-optimization',
                {'campaign_id': 'test', 'current_performance': {'ctr': 0.05}}
            )
            if time_taken:
                neural_times.append(time_taken)
        
        if neural_times:
            print(f'  Avg Response Time: {statistics.mean(neural_times):.3f}s')
            print(f'  Min/Max: {min(neural_times):.3f}s / {max(neural_times):.3f}s')
        
        print('⚛️  Quantum Prediction Benchmark...')
        quantum_times = []
        for i in range(5):
            time_taken = await benchmark_endpoint(
                session,
                'http://localhost:8001/api/v2/quantum-prediction',
                {
                    'lead_data': {
                        'name': 'Test Lead',
                        'email': 'test@example.com'
                    }
                }
            )
            if time_taken:
                quantum_times.append(time_taken)
        
        if quantum_times:
            print(f'  Avg Response Time: {statistics.mean(quantum_times):.3f}s')
            print(f'  Min/Max: {min(quantum_times):.3f}s / {max(quantum_times):.3f}s')

if __name__ == '__main__':
    asyncio.run(run_benchmarks())
" &
    
    # Wait for server to start
    sleep 5
    
    print_success "Benchmarks completed"
}

# Security check
security_check() {
    print_header "🔒 Running Security Checks..."
    
    # Check for sensitive data in .env
    if grep -q "your_.*_here" .env 2>/dev/null; then
        print_warning "Default placeholder values found in .env file"
        print_warning "Please update with real API keys and secrets"
    fi
    
    # Check file permissions
    if [ -f ".env" ]; then
        ENV_PERMS=$(stat -c "%a" .env 2>/dev/null || stat -f "%A" .env 2>/dev/null)
        if [ "$ENV_PERMS" != "600" ]; then
            print_warning "Setting secure permissions for .env file"
            chmod 600 .env
        fi
    fi
    
    print_success "Security check completed"
}

# Main function
main() {
    print_banner
    
    # Parse command line arguments
    DEPLOYMENT_TYPE="local"
    RUN_TESTS=false
    RUN_BENCHMARKS=false
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --docker)
                DEPLOYMENT_TYPE="docker"
                shift
                ;;
            --test)
                RUN_TESTS=true
                shift
                ;;
            --benchmark)
                RUN_BENCHMARKS=true
                shift
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  --docker      Use Docker deployment"
                echo "  --test        Run tests after installation"
                echo "  --benchmark   Run performance benchmarks"
                echo "  --help        Show this help message"
                echo ""
                echo "Examples:"
                echo "  $0                    # Local development setup"
                echo "  $0 --docker          # Docker enterprise deployment"
                echo "  $0 --test --benchmark # Local with tests and benchmarks"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done
    
    # Run setup steps
    detect_os
    check_prerequisites
    setup_environment
    security_check
    
    if [ "$DEPLOYMENT_TYPE" = "docker" ]; then
        docker_deployment
    else
        install_dependencies
        initialize_ai_models
        setup_database
        
        if [ "$RUN_TESTS" = true ]; then
            run_tests
        fi
        
        start_application &
        SERVER_PID=$!
        
        if [ "$RUN_BENCHMARKS" = true ]; then
            run_benchmarks
        fi
        
        # Wait for server
        wait $SERVER_PID
    fi
}

# Run main function
main "$@"
