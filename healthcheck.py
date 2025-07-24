"""
Health check script za AI Marketing Agent 2025 Advanced
"""
import requests
import sys
import os

def health_check():
    try:
        port = os.getenv('PORT', '8001')
        response = requests.get(f'http://localhost:{port}/health', timeout=10)
        if response.status_code == 200:
            health_data = response.json()
            if health_data.get('status') == 'healthy':
                print("✅ Health check passed")
                return True
        print("❌ Health check failed")
        return False
    except Exception as e:
        print(f"❌ Health check error: {e}")
        return False

if __name__ == "__main__":
    if health_check():
        sys.exit(0)
    else:
        sys.exit(1)
