---
layout: post
title: Gemma v3
subtitle: testing google's ai locally
date: 2025-03-12
background: /img/headers/maui_craters.jpg
comments: true
published: true
---

<img src="/img/posts/google_gemma.jpeg" class="img-fluid" style="margin-left:10px; float:right"/>

Google has just [released an updated version](https://blog.google/technology/developers/gemma-3/) of their open-source Gemma model.  The new Gemma 3 multimodal (text + image) models. Gemma 3 comes in 1B, 4B, 12B, and 27B sizes and the 27B model matches Gemini-1.5-Pro on many benchmarks. It introduces vision understanding, has a 128K context window, and multilingual support in 140+ languages. I found it [available for Ollama](https://ollama.com/library/gemma3:4b) and downloaded the 4b sized-model to run on my old Nvidia 3070ti card (only 8 GB VRAM).  

<img src="/img/posts/google_gemma_download.png" class="img-fluid" />

## Failed Start

However, even pulling the most recent [Open-WebUI](https://www.openwebui.com/) Docker image (v5.2.0), I discovered that the bundled Ollama within the image was too old to run this new Gemma model.  Here's the error I got on my first prompt:

<img src="/img/posts/google_gemma_ollama_old.png" class="img-fluid" />

So, rather than wait around for the next release of Open-WebUI, I decided to temporarily update the Ollama version in the Docker container:

```
docker exec open-webui apt-get update
docker exec open-webui curl -fsSL https://ollama.com/install.sh | sh
docker restart open-webui
```

## Now Testing

By patching the Ollama version in the container, I was then able to interact with this chatbot at the prompt:

<img src="/img/posts/google_gemma_skyblue.png" class="img-fluid" />

Interestingly, monitoring my GPU memory usage in Windows Task manager, the "4b"-sized model from Ollama took up 6.3 GB of my available 8 GB to run.  The much bigger models (12b and 27b), would no doubt require a much bigger GPU.

### Image Generation

At least thru Open-WebUI, this model can't generate images from a text prompt:

<img src="/img/posts/google_gemma_imggen.png" class="img-fluid" />

### Image Parsing

Next I uploaded an image of the Three Sisters mountain range near Canmore, Alberta and asked a very generic question for the LLM to determine the subject.  

<img src="/img/posts/google_gemma_3sisters.png" class="img-fluid" />

Gemma v3 successfully analyzed the photo as containing 3 mountain peaks, though did get the exact location wrong.  Still good example of image parsing in Open-WebUI.

### Multi-language Support

Next, I switched to French to see how well Gemma v3 interacted:

<img src="/img/posts/google_gemma_french.png" class="img-fluid" />

### Safety Protocols

So, one of the ongoing complaints of Google Gemini AI (online) and Gemma (offline) models has been its self-censorship.  In particular, both models generally refuse to discuss politics, outside of historical facts.  It seems this new version of Gemma continues that tradition unfortunately:

<img src="/img/posts/google_gemma_politics.png" class="img-fluid" />

### Training Date Age

As this a "free" model, I would not expect it to know current events.  It seems to be trained up to 2023-10-26, so about 1.5 years ago.  Don't bother asking about current events.

<img src="/img/posts/google_gemma_training_day.png" class="img-fluid" />

Rather, I think one needs to use [Google Gemini](https://gemini.google.com/app/), which knows the latest:

<img src="/img/posts/google_gemini_current_events.png" class="img-fluid" />

## Conclusions

So, overall I'm quite impressed with this open-weight model from Google, available on a number of platforms, including Open-WebUI/Ollama as described above.  Clearly, progress is happening quickly in this space, leading to more effective models running on smaller and smaller hardware.  I expect usage on phones will increase this year.

However, I believe the cutting edge will continue to be served up via large cloud servers, as paid plans such as [Gemini Advanced](https://one.google.com/about/ai-premium/), [Claude Pro](https://claude.ai/upgrade), and [ChatGPT Plus and Pro](https://openai.com/chatgpt/pricing/).  In fact, I expect Google's wide-footprint in the consumer space will give Gemini the edge in the long term, as the pre-eminent AI in people's lives.


### More in this series...
* [Google Gemini](/2024/02/16/google-gemini) - Google Gemini
* [Anthropic Claude](/2024/03/04/anthropic-claude) - Anthropic Claude
* [Llama 3](/2024/04/19/llama-3) - Llama 3
* [ChatGPT 4o](/2024/05/21/chatgpt-4o) - ChatGPT 4o
* [Anthropic Claude in Canada](/2024/06/05/anthropic-claude-canada) - Claude eh?
* [LLMs on Android](/2024/07/18/llms-on-android) - AI in your pocket
* [Google Imagen3](/2024/08/28/google-imgen3) - AI Image Generation
* [Azure AI Studio](/2024/09/30/azure-ai-studio) - AI on MS Azure
* [Google AI Studio](/2024/12/08/google-ai-studio) - AI on Google
* [Ollama](/2025/01/03/ollama) - Local LLMs on your own computer.
