---
layout: post
title: LLMs on Android - Updated
subtitle: ai in your pocket
date: 2026-01-04
background: /img/headers/snow_quad.jpg
comments: true
published: true
---

Since my [earlier testing of Chatbots on Android](/2024/07/18/llms-on-android) years ago, a lot of changes have happened.  I'm revisiting the options for an Android phone/tablet user to interact with LLMs now.  There are many more options now, ranging from cloud services down to on-device models.

<style>
.device-bezel {
  width: 30%; 
  border: 8px solid #222; /* Simulates the phone frame */
  border-radius: 36px;    /* High radius for that "handheld" feel */
  background: #222;       /* Fills gaps if image doesn't perfectly fit */
  box-shadow: 0 20px 40px rgba(0,0,0,0.2);
}
</style>

# Cloud Services

All of the options in this section are thin apps that simply pass your query up into the cloud. As a positive, this is often the fastest and most featureful appproach.  On the negative side, you lose all privacy when conversing with a corporate cloud.

## OpenAI ChatGPT

<img src="/img/posts/llms_android_chatgpt.png" class="device-bezel"/>  <img src="/img/posts/llms_android_chatgpt_hello.png" class="device-bezel"/>

## Anthropic Claude

<img src="/img/posts/llms_android_claude.png" class="device-bezel"/>  <img src="/img/posts/llms_android_claude_hello.png" class="device-bezel"/>

## Google Gemini

<img src="/img/posts/llms_android_gemini.png" class="device-bezel"/>  <img src="/img/posts/llms_android_gemini_hello.png" class="device-bezel"/>

## Microsoft Copilot

<img src="/img/posts/llms_android_copilot.png" class="device-bezel"/>  <img src="/img/posts/llms_android_copilot_hello.png" class="device-bezel"/>

## Mistral AI

<img src="/img/posts/llms_android_mistral.png" class="device-bezel"/>  <img src="/img/posts/llms_android_mistral_hello.png" class="device-bezel"/>

## Alibaba Qwen

<img src="/img/posts/llms_android_qwen.png" class="device-bezel"/>  <img src="/img/posts/llms_android_qwen_hello.png" class="device-bezel"/>

## MoonshotAI Kimi

<img src="/img/posts/llms_android_kimi.png" class="device-bezel"/>  <img src="/img/posts/llms_android_kimi_hello.png" class="device-bezel"/>

# Home LAN LLMs

After my [deployment](/2025/01/03/ollama) of private Gemma, Mistral, and Qwen LLMs on my home LAN, running Ollama on each PC, with a [single instance of OpenWebUI](/2025/10/20/ollama_amd_gpu) fronting them all, I went looking for a mobile phone app to access my home LLMs.  I found Conduit, which I connected to OpenWebUI via Tailscale on my Unraid server.

## Conduit OpenWebUI

<img src="/img/posts/llms_android_conduit_login.png" class="device-bezel"/> <img src="/img/posts/llms_android_conduit_models.png" class="device-bezel"/>  <img src="/img/posts/llms_android_conduit_hello.png" class="device-bezel"/>

# On Device Models

The real future of LLMs will likely be on edge devices themselves as phones/tablets get more powerful hardware.  At this point, with my mid-range Google Pixel 9a, local LLMs can be run quite effectively.

## Google Edge

The Edge app from Google is more of a playground demonstration than a real Chatbot app.  They are mainly trying to attract developers looking to include AI in their apps, without requiring a network connection or cloud service.

<img src="/img/posts/llms_android_edge.png" class="device-bezel"/>  <img src="/img/posts/llms_android_edge_hello.png" class="device-bezel"/>

## Apollo LEAP

Similarly, the LEAP models in Apollo seem to be a developer demonstration, aiming for adoption and integration.

<img src="/img/posts/llms_android_leap.png" class="device-bezel"/>  <img src="/img/posts/llms_android_leap_hello.png" class="device-bezel"/>

## Pocketpal AI

Pocketpal seems to the leader of true on-device Chatbots, offering a wide-selection of free models.

<img src="/img/posts/llms_android_pocketpal.png" class="device-bezel"/>  <img src="/img/posts/llms_android_pocketpal_hello.png" class="device-bezel"/>

## Chatbox AI

On the otherhand, ChatboxAI mentioned a "Free" version, but I couldn't seem to get to it, instead only being shown license sales pages...

<img src="/img/posts/llms_android_chatbox.png" class="device-bezel"/>  <img src="/img/posts/llms_android_chatbox_free.png" class="device-bezel"/>

### More in this series...
* [LLMs on Android](/2024/07/18/llms-on-android) Apps accessing Cloud Services
