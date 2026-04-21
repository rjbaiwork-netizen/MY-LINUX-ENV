#!/bin/bash

# কনফিগারেশন ফাইলের পাথ
RCLONE_CONF_PATH="$HOME/.config/rclone/rclone.conf"

echo "📡 Starting backup process..."

# Rclone কনফিগারেশন ফাইল আছে কি না চেক করা
if [ -f "$RCLONE_CONF_PATH" ]; then
    # 'gdrive' হলো আপনার rclone.conf-এ দেওয়া রিমোট নাম
    # 'MY-BACKUP' হলো আপনার গুগল ড্রাইভের ফোল্ডার নাম
    echo "📤 Uploading data to Cloud Storage..."
    rclone sync ./data gdrive:MY-BACKUP --progress
    
    if [ $? -eq 0 ]; then
        echo "✅ Backup successfully completed!"
    else
        echo "❌ Backup failed! Please check rclone logs."
    fi
else
    echo "⚠️ Error: rclone.conf not found at $RCLONE_CONF_PATH"
    echo "Please make sure your GitHub Secrets are configured correctly."
fi
