#!/bin/bash
# Start script za AI Marketing Agent

echo "🎯 Pokretam AI Marketing Agent..."
echo "📍 Lokacija: /Users/dennzy/ai-marketing-agent"
echo "🌐 URL: http://localhost:8000"
echo "📖 Docs: http://localhost:8000/docs"
echo "🎯 Marketing Examples: ./marketing_examples.sh"
echo ""

cd /Users/dennzy/ai-marketing-agent
./venv/bin/python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000
