---
layout: post
title: Ollama with AMD
subtitle: using a Radeon 6700xt gpu
date: 2025-10-20
background: /img/headers/grinell_glacier_hike3.jpg
comments: true
published: true
---

Earlier this year, I experimented with various LLM models using [Ollama](/2025/01/03/ollama) on [our gaming PC](/2019/07/16/zen2_pc_gaming/) with a Nvidia RTX 3070ti GPU.  At the time, I had also tried with [our other gaming PC](/2018/11/09/budget_pc_gaming/) running on an AMD Radeon 6700xt GPU.  Unfortunately, I wasn't successful and the models on that PC had fallen back to the CPU, resulting in running times at least 10x slower than the Nvidia GPU system.

Since then, enthusiasts online have filled in the support that [AMD themselves can't seem to deliver](https://www.reddit.com/r/Amd/comments/1la9yz9/comment/mxjo1nt/).  Thanks to this [Github project](https://github.com/likelovewant/ollama-for-amd), it is now possible to run recent models on the 6700xt GPU (aka gfx1031).  

## Installing Ollama

On this PC, I install apps and data on the larger D: drive, so first download [OllamaSetup.exe](https://github.com/likelovewant/ollama-for-amd/releases) and install via Powershell:

`.\OllamaSetup.exe /DIR="D:\Program Files\Ollama"`

Then quit Ollama from system tray and download the [correct ROCM libraries](https://github.com/likelovewant/ROCmLibs-for-gfx1103-AMD780M-APU/releases/tag/v0.6.4.2) for the 6700xt which is the gfx1031 generation.

1. Find the rocblas.dll file and the rocblas/library folder within your Ollama installation folder (located at D:\Program Files\Ollama\lib\ollama\rocm).
2. Delete the existing `rocblas/library` folder.
3. Replace it with the correct ROCm libraries. 
4. Set env var OLLAMA_MODELS=D:\Program Files\Ollama\models  (create the folder)
5. Then run Ollama again from Start menu.

Then launch OpenWebUI in Docker:

<img src="/img/posts/ollama_amd_gpu_docker.png" class="img-fluid" /> 

```
docker run -d `
   -p 3000:8080 `
   -v open-webui:/app/backend/data `
   --name open-webui `
   --restart always `
   -e OLLAMA_BASE_URL=http://host.docker.internal:11434 `
   ghcr.io/open-webui/open-webui:main
```

Then browse to http://localhost:3000 to access OpenWebUI, where I tested the recent Qwen v3 model:

<img src="/img/posts/ollama_amd_gpu_qwen_chat.png" class="img-fluid" /> 

Monitoring the speed of the response, I was pleasantly surprised.  Much faster than the CPU-fallback mode I experienced earlier.  Ollama reported GPU being used:

<img src="/img/posts/ollama_amd_gpu_list_ps.png" class="img-fluid" /> 

Monitoring the GPU usage via Task Manager, I was able to run queries against both Qwen and Gemma, though that is a bit too tight:

<img src="/img/posts/ollama_amd_gpu_usage.png" class="img-fluid" /> 

### More in this series...
* [Llama 3](/2024/04/19/llama-3) - Llama 3
* [Ollama](/2025/01/03/ollama) - Ollama via OpenWebUI
* [Deepseek](/2025/02/06/deepseek-distill) - Trying small distills locally.
