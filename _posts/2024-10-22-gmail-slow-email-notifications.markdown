---
layout: post
title: GMail Delayed Notifications
subtitle: you've got mail! hours ago...
date: 2024-10-22
background: /img/headers/ribbon_lake.jpg
comments: true
published: true
---

Are you a Gmail user and do you get a handful of important emails every so often?  Would you like to get a notification on your Android phone and/or watch as soon as the email is received?  Well, tough shit!  Gmail on Android simply does not support timely notification of emails, instead happily providing a notification between many minutes to even hours later.  Don't give up hope though, <a href="#sms-gateway">SMS gateways</a> to the rescue!

## Battery Life over All Else

In short, recent changes to Google's Gmail app for Android phones have prioritized battery life over all other concerns. No matter what combination of settings I've tried, not a single approach has actually been able to to deliver a timely notification of new priority email. My test case is a Google Pixel 6a phone with a Google Watch (v1), connected to my home Wifi, with reliable Internet connection.  

## Gmail Test Cases

Here's a list of all the failed approaches to this notification problem that I gathered from around the web.

### Background Usage

Go to 'Settings' on your Phone.  Choose 'Apps', then select 'Gmail' from the list.  Select "Notifications" and turn on all the choices on this screen. Back up to Settings for the Gmail app, click on 'App battery usage', and ensure that "Allow background usage" is enabled.  In theory, this should ensure that Gmail does not get dozed, unable to receive timely notifications. However, my testing showed this background mode does nothing to result in more frequent email checks.  Useless approach.

### Doze Stopper

On one of the many forums where Gmail users complain about this broken notification behaviour, I saw someone even created an app named "Doze Stopper" in the Google Play store.  Tried it out, however my testing showed this app had no effect on Gmail sending timely notifications. Uninstalled.

### "Priority" Emails

Instead of notifying for all new emails, I thought I'd try [alerting on only "High priority" emails](https://support.google.com/mail/answer/1075549?hl=en&co=GENIE.Platform%3DAndroid#zippy=%2Cturn-on-notifications%2Cget-notified-for-just-high-priority-emails%2Cturn-off-notifications).  After testing this approach, it made no difference.  Gmail simply is not waking up from doze (battery conservation mode) to check for any new emails, regardless of priority.

### Google Support

After posting a one-star review of Gmail, their tech support replied with a set of [generic troubleshooting instructions](http://goo.gl/kWctv9).  None of these were relevant to the problem and none of them had any effect on how quickly Gmail alerted on my phone.

## <a id="sms-gateway">SMS Workaround</a>

So after exhausting all avenues above to get my phone to display timely email notifications, I noticed that my phone did display SMS text messages nearly instantly.  So I cooked up a workaround that involved triggering an SMS message to my phone based on an email forward rule in the Gmail service itself.

### Carrier SMS Gateway

For this to work, your cell phone provider must offer an SMS gateway which, after enabling receipt from your @gmail.com address, can receive a forwarded email, convert it to text, and send it as SMS to your phone.  In my case, the flow looks like this:

<pre>
important_sender@company.com  
    --> (sends) -->  
        my_email_address@gmail.com
            -->  (forwards) --> 
                1234567890@txt.freedommobile.ca  
                    --> (texts) -->
                        my Pixel phone which immediately shows notification.
</pre>

However, setting up an email forward target address on Gmail is protected by an authorization process.  In order to send to my SMS gateway, Google sent a verbose confirmation email.  Unfortunately, my SMS Gateway trims the SMS text to just a few sentences, which left off the Google confirmation link that needed to be clicked.  So, I had to forward the important email from Gmail to another email address I set up in my own domain, which then redirected to my SMS gateway.

<pre>
important_sender@company.com  
   --> (sends) -->  
        my_email_address@gmail.com
            -->  (forwards) --> 
                alert_me@mydomain.ca
                    -->  (redirects) --> 
                        1234567890@txt.freedommobile.ca  
                            --> (texts) -->
                                my Pixel phone which immediately shows notification.
</pre>

By adding this extra hop, I was able to use my the webmail interface at @mydomain.ca to receive and confirm the incoming forwards were allowed from Gmail. This closed the loop, ensuring that as soon as <i>important_sender@company.com</i> sent me an email, I would get an SMS notification on my phone and watch.  Testing this showed the lag to be mere seconds, instead of the minutes, and even hours, that Gmail on my phone took to alert me.

## Conclusions

To be clear, the SMS message was heavily truncated so the receipt of the text simply alerted me to the need to switch to Gmail and drag from the top of my inbox to force a refresh, instantly revealing the just arrived important email.  Hilariously, the receipt of the SMS text was enough of <i>a kick in the ass for my phone<i> to wake up and... <b>simultaneously notify me of the new email's arrival</b>. 

Overall, the above workaround requires both a third-party email address and a SMS email-to-text gateway provided by your cell carrier. This level of complexity is beyond the average email user, making the complete lack of a prompt email notification for Gmail on Android all the more perplexing.  


## Update

So just a few weeks after I set this forwarding up, my cell provider decided to [deprecate their SMS Gateway](https://www.freedommobile.ca/en-CA/support/about-the-text-to-email-service), effective 2024-12-01.  So, given this I needed a new way to send a notification to my phone, based on an email, that would consistently notify immediately on arrival, not hours later like the GMail app does.

After searching around, I found that the Pushover app has [an email gateway](https://support.pushover.net/i29-e-mailing-notifications-to-your-devices) that allows to trigger Pushover notifications.  After testing, this new approach also works well and doesn't get "dozed" for hours like Gmail does.  

<pre>
important_sender@company.com  
   --> (sends) -->  
        my_email_address@gmail.com
            -->  (forwards) --> 
                alert_me@mydomain.ca
                    -->  (redirects) --> 
                        my_pushover_id@pomail.net  
                            --> (texts) -->
                                my Pixel phone which immediately shows notification.
</pre>

Pushover app on Android costs about $5 CAN, but seems worth it to get a workaound for Gmail's horrible notification times.
