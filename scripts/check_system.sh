#!/bin/bash

echo "🔍 Starting Automatic System Check..."
echo "------------------------------------"

# ১. নেটওয়ার্ক পোর্ট চেক (৬০৮০ এবং ৫৯০১)
echo "🌐 Checking Ports..."
for port in 6080 5901; do
    if sudo lsof -i :$port > /dev/null; then
        echo "✅ Port $port is OPEN and RUNNING."
    else
        echo "❌ Port $port is CLOSED! (Desktop service might be down)"
    fi
done

# ২. ডেস্কটপ প্রসেস চেক
echo "🖥️ Checking Desktop Process..."
if ps aux | grep -E "[X]vnc|[n]ovnc" > /dev/null; then
    echo "✅ VNC/Desktop service is ACTIVE."
else
    echo "❌ VNC/Desktop service is NOT RUNNING."
fi

# ৩. পারমিশন চেক
echo "🔑 Checking Script Permissions..."
if [[ -x "scripts/setup.sh" && -x "scripts/backup.sh" ]]; then
    echo "✅ Scripts have execute permissions."
else
    echo "❌ Permissions missing! Run: chmod +x scripts/*.sh"
fi

# ৪. ডিস্ক স্পেস চেক
echo "💾 Checking Disk Space..."
df -h | grep "/workspaces" | awk '{print "Available Space: " $4}'

# ৫. সলিউশন কমান্ড (যদি সমস্যা থাকে)
echo "------------------------------------"
echo "💡 Suggested Fix:"
echo "If ports are closed, try running: sudo /usr/bin/desktop-init.sh"
