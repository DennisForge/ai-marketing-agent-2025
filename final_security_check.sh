#!/bin/bash
# Final Security Check za AI Marketing Agent

echo "🔒 FINALNA BEZBEDNOSNA PROVERA"
echo "==============================="
echo ""

# Check for API keys
echo "🔍 Proverim API ključeve..."
if grep -r "OPENAI_API_KEY.*sk-" . --exclude-dir=venv --exclude-dir=.git --exclude="*security_check.sh" --exclude="final_security_check.sh" 2>/dev/null; then
    echo "❌ OPASNOST: Pronađeni API ključevi!"
    exit 1
else
    echo "✅ Nema API ključeva u kodu"
fi

# Check for personal info
echo ""
echo "🔍 Proverim lične podatke..."
if grep -r -i "dennzy88\|Direct Advertising DOO" . --exclude-dir=venv --exclude-dir=.git --exclude="*security_check.sh" --exclude="final_security_check.sh" --exclude="FINAL_CLEANUP_REPORT.md" 2>/dev/null; then
    echo "❌ UPOZORENJE: Pronađene stare reference!"
    exit 1
else
    echo "✅ Nema starih referenci"
fi

# Check .env file
echo ""
echo "🔍 Proverim .env fajl..."
if grep -q "OPENAI_API_KEY.*sk-proj" .env 2>/dev/null; then
    echo "❌ OPASNOST: Pravi API ključ u .env!"
    exit 1
else
    echo "✅ .env fajl je čist"
fi

# Check .gitignore
echo ""
echo "🔍 Proverim .gitignore..."
if grep -q "\.env" .gitignore; then
    echo "✅ .env je u .gitignore"
else
    echo "❌ DODAJ .env u .gitignore!"
    exit 1
fi

echo ""
echo "🎉 SVE JE BEZBEDNO ZA GITHUB!"
echo "✅ Možeš da push-uješ na GitHub"
