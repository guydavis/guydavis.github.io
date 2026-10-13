---
layout: post
title: "Unsloth Desktop"
subtitle: "install issues"
date: 2026-10-12
background: /img/headers/maligne_canyon6.jpg
comments: true
published: true
---

## Windows 11 with an AMD RX 6750xt

I installed [Unsloth Desktop](https://unsloth.ai/) on my Windows 11 PC with an AMD Radeon RX 6750 XT. The installation completed, but the app crashed whenever I tried to run a model. I wasn't able to get any model running.

<img src="/img/posts/unsloth_desktop_amd.png" class="img-fluid" />

That left me unable to evaluate the app beyond installation. This was my experience on this particular AMD system; I haven't established what caused the crashes, though the fault almost certainly lies with the extremely poor AMD support for running any AI tools on their older hardware.

## Windows 11 with an Nvidia RTX 3070ti

I also tried installing Unsloth Desktop on another Windows 11 PC, this one with an Nvidia RTX 3070 Ti. The C: drive was already tight on space, and I couldn't spare the many gigabytes the full Unsloth installation would require.

The installer didn't offer a way to put Unsloth itself, its utilities, or its caches on another drive such as D:. Since I couldn't redirect those files, I couldn't proceed with the installation. That makes the app unusable for my setup, and a significant limitation for developers who keep applications and large data on separate drives.

## Conclusions

Given the crashes (on AMD) and the lack of basic installer features (target other drive), I wasn't able to try out any aspect of Unsloth Desktop.  I'll check again in a few months to see if they have improved the experience.

### More in this series...
* [Ollama with AMD](/2025/10/20/ollama_amd_gpu) - Running local language models on AMD GPUs.
