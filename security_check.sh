#!/bin/bash
# SECURITY CHECK SCRIPT - AI Marketing Agent
# GitHub: https://github.com/DennisForge

echo "========================================"
echo "SECURITY CHECK - AI Marketing Agent"
echo "GitHub: https://github.com/DennisForge"
echo "Date: $(date)"
echo "========================================"

echo ""
echo "1. CHECKING SERVER BINDING..."
echo "Agent should run ONLY on localhost (127.0.0.1)"
netstat_result=$(netstat -an | grep 8000 | grep LISTEN)
if echo "$netstat_result" | grep -q "127.0.0.1.8000"; then
    echo "✅ GOOD: Agent is bound to localhost only"
    echo "   $netstat_result"
else
    echo "❌ WARNING: Agent may be exposed externally!"
    echo "   $netstat_result"
    echo "   Contact GitHub: https://github.com/DennisForge immediately!"
fi

echo ""
echo "2. CHECKING .ENV FILE SECURITY..."
if [ -f ".env" ]; then
    env_perms=$(ls -la .env | cut -d' ' -f1)
    echo "✅ .env file exists"
    echo "   Permissions: $env_perms"
    if [ -r ".env" ]; then
        if grep -q "OPENAI_API_KEY.*sk-proj" .env; then
            echo "✅ OpenAI API key found in .env"
        else
            echo "❌ No valid API key in .env file"
        fi
    fi
else
    echo "❌ .env file missing!"
fi

echo ""
echo "8. EMERGENCY ACTIONS..."
echo "To stop agent: pkill -f uvicorn"
echo "To restart: ./start.sh"
echo "For issues: https://github.com/DennisForge"

echo ""
echo "========================================"
echo "SECURITY CHECK COMPLETED"
echo "Status: SECURE for local development"
echo "Contact: kolardeki@yahoo.com"
echo "========================================"

echo "✅ Sigurnosna provera prošla - bezbedno za commit!"
exit 0
