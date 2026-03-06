---
layout: post
title: OpenClaw
subtitle: surprises and challenges
date: 2026-03-05
background: /img/headers/maligne_canyon7.jpg
comments: true
published: true
---

Recently, I set out to install and configure [OpenClaw,](https://openclaw.ai/) a process that proved to be quite an adventure, involving various servers, AI models, and networking challenges.

## The Installation Challenge

The installation process proved more complicated than a straight out-of-the-box experience. One of the main hurdles was dealing with localhost binding and the need to port-forward traffic. I had to route connections from my Ubuntu server, `merry`, over to my Unraid server, `aragorn`. This required carefully configuring SSH and networking settings to ensure that the services could communicate properly across my home lab setup.

## Primary Agent: Gemini Flash

For the primary agent, I decided to go with Gemini Flash. I'm leveraging my Google Pro AI subscription for this. I bound my Google AI Studio project to the [$10 USD per month credit provided by Google](https://support.google.com/googleone/answer/14534406?hl=en) to cut API costs. This setup gives OpenClaw access to a decent reasoning model.  Not as good as Anthropic's newest Opus model, if reviews are to be believed,  but I'm not paying $$$ for that.

<img src="/img/posts/openclaw_installation_gemini.png" class="img-fluid" /> 

## Remote Access via Telegram and Discord

One of the real nice features of OpenClaw is the ability to access it remotely via Telegram and Discord. I set up a webhook for both services to allow me to interact with the agent from anywhere.

<style>
.device-bezel {
  width: 30%; 
  border: 8px solid #222; /* Simulates the phone frame */
  border-radius: 36px;    /* High radius for that "handheld" feel */
  background: #222;       /* Fills gaps if image doesn't perfectly fit */
  box-shadow: 0 20px 40px rgba(0,0,0,0.2);
}
</style>

<img src="/img/posts/openclaw_installation_telegram.png" class="device-bezel"/>  <img src="/img/posts/openclaw_installation_discord.png" class="device-bezel"/>

## Secondary Agent: Ollama and AMD GPUs

I also wanted a local, open-source fallback. I made repeated attempts to configure a secondary agent connecting to my local Ollama server. This server is busy running various models on some older hardware—specifically, an AMD RX590 GPU. Getting the tools and Ollama to play nicely with an older AMD card turned out to be a failure though.  I *think* the issue was the huge context being passed to the model on every prompt by OpenClaw. I may try again in the future with a more recent card.

## Network Monitoring with Unifi

Finally, to bring everything together, I configured a Unifi skill for the agent. This allows OpenClaw to integrate with my network controller and keep an active eye on my home network's health, giving the agent the ability to check on my devices and network topology.

<img src="/img/posts/openclaw_installation_chat_unifi.png" class="img-fluid" /> 

## Conclusions

Overall, the initial setup was complex and I was able to get a few things working.  I completely struck-out on working useful local agents however, so I am not interested in building a lot of workflows that will simply generate a lot of API calls and big Google AI bills.

I'll keep an eye on the project and may try again in the future once they improve the efficiency of local agents, allowing older hardware to be used more effectively.