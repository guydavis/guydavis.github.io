---
layout: post
title: Deepseek Distill
subtitle: testing tiny models
date: 2025-02-06
background: /img/headers/carthew_alderson_redstone.jpg
comments: true
published: true
---

<img src="/img/posts/deepseek_logo.png" class="img-fluid" style="margin-left:10px; float:right"/>

With all the hype about LLMs, the stock market was surprised by the Deepseek r1 model release in late January, leading to a [large selloff](https://www.reuters.com/technology/chinas-deepseek-sets-off-ai-market-rout-2025-01-27/) in Nvidia shares.  The thinking was that Deepseek trained their model very cheaply, barely using Nvidia chips, for $5 million, instead of the billions being spent by large US firms.  A week later, it turns out the news headline was wrong and they spent [$1.6 billion using 50k Nvidia GPUs](https://www.windowscentral.com/software-apps/deepseek-6-million-r1-cost-efficient-model-training-might-be-a-ruse).  Good example of why the headline news should be read with skepticism.

As I have been [playing](/2025/01/03/ollama) around with small models on an old gaming PC using Ollama, however with only a RTX 3070ti GPU having 8 GB VRAM, running the fullsized Deepseek r1 is not possible.  This is too bad as apparently the r1 model is quite good. Instead, it is possible to try running [a distilled model](https://ollama.com/library/deepseek-r1).  These are actually Qwen models that have been distilled using Deepseek r1.  

<img src="/img/posts/deepseek_ollama_distills.png" class="img-fluid" />

In my case, I'll try the 7b model, downloading via "Settings > Admin Settings > Connections > Manage Ollama API Connections":

<img src="/img/posts/deepseek_ollama_7b_download.png" class="img-fluid" />

This results in the chat window shown:

<img src="/img/posts/deepseek_prompt_window.png" class="img-fluid" />

As r1 is a "thinking" model it is quite verbose, but does a good job of explaining its though process in the &lt;think&gt; tag:

<img src="/img/posts/deepseek_sky_blue.png" class="img-fluid" />

This response came back in roughly 20 seconds, which wasn't too bad for my old GPU.  I followed up with: "Is that on planet Earth only? What about on Mars?"

<img src="/img/posts/deepseek_sky_mars.png" class="img-fluid" />

## Conclusions

This dabbling with a distilled model on old hardware is fun, but not at all reflective of Deepseek's true performance.  Hugging Face [reports](https://huggingface.co/deepseek-ai/DeepSeek-R1) this model "achieves performance comparable to OpenAI-o1 across math, code, and reasoning tasks."  Overall, the LLM space continues with rapid improvements.  Just this week Google released [Gemini 2.0](https://blog.google/technology/google-deepmind/gemini-model-updates-february-2025/) which looks promising.

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
* [Google Gemma](/2025/03/12/google-gemma3) - Google Gemma v3 released.
