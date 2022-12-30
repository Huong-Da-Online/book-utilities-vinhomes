QUEUE_STATUS=$(ps aux | grep "schedule:work")

if $(echo $QUEUE_STATUS | grep --quiet 'artisan schedule:work'); then
    exit
else
    php ~/public_html/artisan schedule:work
    exit
fi
