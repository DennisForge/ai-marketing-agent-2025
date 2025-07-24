#!/bin/bash
# Marketing Examples for AI Marketing Agent

echo "🎯 AI MARKETING AGENT - EXAMPLES"
echo "================================="
echo ""

API_URL="http://localhost:8000"

echo "1. 📝 AD COPY GENERATION"
echo "------------------------"
curl -X POST "$API_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create 3 Facebook ad headlines for luxury watches targeting men 30-50 with high income",
    "session_id": "luxury_watch_campaign"
  }' | python3 -m json.tool

echo ""
echo "2. 🎯 LEAD QUALIFICATION" 
echo "------------------------"
curl -X POST "$API_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Qualify this lead: Ana, 32, restaurant owner, needs social media marketing, budget $2000/month",
    "session_id": "lead_ana_restaurant"
  }' | python3 -m json.tool

echo ""
echo "3. 📊 CAMPAIGN ANALYSIS"
echo "-----------------------"
curl -X POST "$API_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Analyze campaign: 2500 clicks, 85 conversions, $750 spend, selling $89 course",
    "session_id": "course_campaign_analysis"
  }' | python3 -m json.tool

echo ""
echo "4. 🚀 STRATEGY DEVELOPMENT"
echo "--------------------------"
curl -X POST "$API_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create marketing strategy for Serbian furniture company wanting to expand to EU market",
    "session_id": "furniture_eu_expansion"
  }' | python3 -m json.tool

echo ""
echo "5. 📱 SOCIAL MEDIA CONTENT"
echo "--------------------------"
curl -X POST "$API_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Create 5 Instagram post ideas for fitness supplement brand targeting women 25-35",
    "session_id": "fitness_instagram_content"
  }' | python3 -m json.tool

echo ""
echo "✅ Marketing examples completed!"
echo "Visit http://localhost:8000/docs for interactive testing"
