# 🎯 AI Marketing Agent - Marketing Use Cases

## 📝 **Campaign Creation Examples**

### **Facebook Ad Copy Generation**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create Facebook ad for luxury handbags, target women 25-45, budget $100/day",
    "session_id": "luxury_handbags_fb"
  }'
```

### **Google Ads Headlines**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Generate 5 Google Ads headlines for dentist office in Belgrade, focus on teeth whitening",
    "session_id": "dentist_belgrade_google"
  }'
```

### **LinkedIn B2B Campaign**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create LinkedIn campaign for B2B software company targeting HR managers",
    "session_id": "b2b_software_linkedin"
  }'
```

## 💰 **Lead Generation & Qualification**

### **Lead Scoring**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Score this lead: Marko, 28, owns gym, interested in fitness equipment financing, income €50k",
    "session_id": "lead_marko_gym"
  }'
```

### **Follow-up Email Sequences**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create 3-email follow-up sequence for real estate leads who downloaded our guide",
    "session_id": "real_estate_followup"
  }'
```

### **Sales Script Generation**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create phone script for selling digital marketing services to restaurants",
    "session_id": "restaurant_sales_script"
  }'
```

## 📊 **Campaign Analytics & Optimization**

### **Performance Analysis**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Analyze: 5000 impressions, 150 clicks, 8 conversions, $200 spend, selling $500 service",
    "session_id": "service_campaign_analysis"
  }'
```

### **A/B Test Recommendations**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Suggest A/B tests for landing page selling online courses, current conversion 2.3%",
    "session_id": "course_landing_ab_test"
  }'
```

### **Budget Optimization**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Optimize €2000 monthly budget across Google, Facebook, LinkedIn for SaaS company",
    "session_id": "saas_budget_optimization"
  }'
```

## 🎨 **Content Marketing**

### **Blog Post Ideas**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Generate 10 blog post topics for accounting firm targeting small businesses",
    "session_id": "accounting_blog_topics"
  }'
```

### **Social Media Calendar**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create weekly social media calendar for bakery in Belgrade, include local events",
    "session_id": "bakery_social_calendar"
  }'
```

### **Email Newsletter Content**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Write monthly newsletter for tech startup, include product updates and tips",
    "session_id": "tech_newsletter"
  }'
```

## 🏢 **Business Strategy & Client Management**

### **Proposal Generation**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create marketing proposal for hotel chain wanting to increase direct bookings",
    "session_id": "hotel_chain_proposal"
  }'
```

### **Competitive Analysis**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Analyze competitor strategy for Serbian e-commerce fashion brand vs international brands",
    "session_id": "fashion_competitive_analysis"
  }'
```

### **Market Entry Strategy**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Develop market entry plan for German car parts company entering Serbian market",
    "session_id": "german_carparts_serbia"
  }'
```

## 🎯 **Industry-Specific Campaigns**

### **E-commerce**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create Black Friday campaign strategy for electronics store, budget €5000",
    "session_id": "electronics_black_friday"
  }'
```

### **Real Estate**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Generate property listing descriptions that convert, focus on luxury apartments",
    "session_id": "luxury_property_listings"
  }'
```

### **Healthcare**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create patient acquisition campaign for private clinic, compliance with medical advertising rules",
    "session_id": "clinic_patient_acquisition"
  }'
```

### **B2B Services**
```bash
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Develop lead generation strategy for IT consulting firm targeting banks",
    "session_id": "it_consulting_banks"
  }'
```

## 📱 **Integration Examples**

### **CRM Integration (JavaScript)**
```javascript
// Qualify leads automatically
const qualifyLead = async (leadData) => {
  const response = await fetch('http://localhost:8000/ask', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      prompt: `Qualify and score this lead: ${JSON.stringify(leadData)}`,
      session_id: `lead_${leadData.id}`
    })
  });
  return await response.json();
};
```

### **Campaign Management (Python)**
```python
# Generate campaign variations
def generate_campaign_variations(product, audience, budget):
    response = requests.post("http://localhost:8000/ask", json={
        "prompt": f"Create 5 campaign variations for {product}, audience: {audience}, budget: {budget}",
        "session_id": f"campaign_{product}_{datetime.now().strftime('%Y%m%d')}"
    })
    return response.json()["reply"]
```

### **Analytics Dashboard (React)**
```jsx
// Campaign performance insights
const getCampaignInsights = async (campaignData) => {
  const response = await fetch('http://localhost:8000/ask', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      prompt: `Analyze campaign performance and provide optimization recommendations: ${JSON.stringify(campaignData)}`,
      session_id: `analysis_${campaignData.campaignId}`
    })
  });
  return await response.json();
};
```

---

## 🚀 **Getting Started**

1. **Setup Environment**
   ```bash
   cd ai-marketing-agent
   cp .env.example .env
   # Add your OpenAI API key
   ```

2. **Install Dependencies**
   ```bash
   python -m pip install -r requirements.txt
   ```

3. **Run Marketing Agent**
   ```bash
   uvicorn main:app --reload
   ```

4. **Test Marketing Features**
   ```bash
   ./marketing_examples.sh
   ```

5. **Access Interactive Docs**
   ```
   http://localhost:8000/docs
   ```

---

**© 2025 DennisForge**
