#!/bin/bash

echo "=== Git Operations Verification ==="

# Check if repositories exist and are valid git repos
echo "1. Checking backend repository:"
if [ -d "/mnt/v2-markets/prod_pl/server/production/.git" ]; then
    cd /mnt/v2-markets/prod_pl/server/production
    echo "✅ Backend repo exists"
    echo "Current branch: $(git branch --show-current)"
    echo "Last commit: $(git log -1 --oneline)"
    echo "Remote URL: $(git remote get-url origin)"
else
    echo "❌ Backend repo not found"
fi

echo ""
echo "2. Checking frontend repository:"
if [ -d "/mnt/www/prod_pl/nespresso_ev2-client/.git" ]; then
    cd /mnt/www/prod_pl/nespresso_ev2-client
    echo "✅ Frontend repo exists"
    echo "Current branch: $(git branch --show-current)"
    echo "Last commit: $(git log -1 --oneline)"
    echo "Remote URL: $(git remote get-url origin)"
else
    echo "❌ Frontend repo not found"
fi

echo ""
echo "3. Testing git connectivity:"
echo "Testing git clone (dry run):"
git ls-remote --heads https://your-bitbucket-url.git 2>&1 | head -5

echo ""
echo "4. Checking deployed files:"
echo "Backend files in /mnt/v2-markets/prod_pl/server/production:"
ls -la /mnt/v2-markets/prod_pl/server/production/ | head -10

echo ""
echo "Frontend files in /mnt/www/prod_pl/nespresso_ev2-client:"
ls -la /mnt/www/prod_pl/nespresso_ev2-client/ | head -10