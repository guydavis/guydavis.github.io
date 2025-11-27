---
layout: post
title: Ollama with AMD
subtitle: using old radeon gpus
date: 2025-10-20
background: /img/headers/grinell_glacier_hike3.jpg
comments: true
published: true
---

Earlier this year, I experimented with various LLM models using [Ollama](/2025/01/03/ollama) on [our gaming PC](/2019/07/16/zen2_pc_gaming/) with a Nvidia RTX 3070ti GPU.  At the time, I had also tried with [our other gaming PC](/2018/11/09/budget_pc_gaming/) running on an AMD Radeon 6700xt GPU.  Unfortunately, I wasn't successful and the models on that PC had fallen back to the CPU, resulting in running times at least 10x slower than the Nvidia GPU system.

Since then, enthusiasts online have filled in the support that [AMD themselves can't seem to deliver](https://www.reddit.com/r/Amd/comments/1la9yz9/comment/mxjo1nt/).  Thanks to this [Github project](https://github.com/likelovewant/ollama-for-amd), it is now possible to run recent models on the 6700xt (aka gfx1031).  Even more impressive, thanks to this [Github project](https://github.com/robertrosenbusch/gfx803_rocm), I was able to rehabilitate my old Radeon RX590 (aka gfx803).

# AMD Radeon 6700xt

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

# AMD Radeon RX 590

For an even bigger challenge, I decided to look at running Ollama using a AMD 590, nearly a decade old card now.

```
sudo docker run -it -d --restart unless-stopped --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -p 8080:8080 -p 11434:11434  --name rocm64_ollama_095 robertrosenbusch/rocm6_gfx803_ollama:6.4.1_0.9.5 bash

sudo docker exec -ti rocm64_ollama_095 bash

./ollama pull gemma3:4b
./ollama pull qwen3:8b
python3 /llm-benchmark/benchmark.py

```

<img src="/img/posts/ollama_amd_gpu_590_model_pulls.png" class="img-fluid" /> 

Then in another shell, I monitored the GPU usage with `amdgpu_top`, ensuring the old card was working as hard as it could:

<img src="/img/posts/ollama_amd_gpu_590_amdgpu_top.png" class="img-fluid" /> 

The results of the benchmark are not fast at all, but just impressive that these new models even run on hardware from a decade ago.  Kudos to [Robert Rosenbusch](https://github.com/robertrosenbusch/gfx803_rocm) for his great work making this possible.

<img src="/img/posts/ollama_amd_gpu_590_benchmark.png" class="img-fluid" /> 

Finally, I browsed to the Ollama webui and asked the Qwen model if it thought I could run it on such an old AMD GPU.  Quite rightly, Qwen advised me that it is highly unlikely it could run on such ancient hardware:

<img src="/img/posts/ollama_amd_gpu_590_qwen3_8b.png" class="img-fluid" />

# Conclusions

Clearly, the open-weight models are rapidly improving if they can run reasonably on such old hardware.  Soon these mid-weight LLMs will run on portable devices such as phones, improving upon the current embedded models.  

With such progress happening, I fail to see why the American tech giants will be able to charge premium subscription prices.  With the AI stock market boom in full swing right now, it will be interesting to see if they are still flying high in a year, in the face of open-weight model competition.

### More in this series...
* [Llama 3](/2024/04/19/llama-3) - Llama 3
* [Ollama](/2025/01/03/ollama) - Ollama via OpenWebUI
* [Deepseek](/2025/02/06/deepseek-distill) - Trying small distills locally.
