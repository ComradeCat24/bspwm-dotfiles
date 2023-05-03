id=$(xdotool getwindowfocus)
if xwininfo -id "$id" | grep -q 'Window id: 0x558'; then
    echo "Desktop"
else
    class=$(xprop -id "$id" WM_CLASS | awk '{print $NF}' | tr -d '"')
    capitalized_class=$(echo "$class" | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}')
    echo "$capitalized_class"
fi

