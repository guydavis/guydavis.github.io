---
layout: post
title: Azure AI Studio
subtitle: microsoft and openai
date: 2024-09-30
background: /img/headers/headwall_lakes.jpg
comments: true
published: true
---

So, with OpenAI's ChatGPT models seeming to lead the way these days for most usecases in generative AI, I went looking for useful developer tools to include these APIs.  With Microsoft's support for OpenAI, the obvious choice was the [MS Azure AI Studio ](https://ai.azure.com/).

## Project Creation

AI Studio groups your work into a hub, which contains projects, which then each hold resources such as Search, Computer Vision, Models, etc. Firstly, I created a new Project:

<img src="/img/posts/azure-ai-studio-create-project.png" class="img-fluid" />


## Chat Model Deployment

I didn't have credits to use OpenAI models, so deployed a Meta Llama model instead.

<img src="/img/posts/azure-ai-studio-deploy-llama1.png" class="img-fluid" />

<img src="/img/posts/azure-ai-studio-deploy-llama2.png" class="img-fluid" />

Unfortunately, that failed:

<img src="/img/posts/azure-ai-studio-deploy-llama3.png" class="img-fluid" />

Probably due to lack of credits prepaid into my account.

## Image Generation

I had more luck when trying the DALL-E 2 playground:

<img src="/img/posts/azure-ai-studio-create-image.png" class="img-fluid" />

## Conclusions

Overall, I didn't have much time to play with this AI Studio.  Seems more intuitive and useful than AWS Sagemker in my experience.  I'll have to explore more in the future...

### More in this series...
* [Google Gemini](/2024/02/16/google-gemini) - Google Gemini
* [Anthropic Claude](/2024/03/04/anthropic-claude) - Anthropic Claude
* [Llama 3](/2024/04/19/llama-3) - Llama 3
* [ChatGPT 4o](/2024/05/21/chatgpt-4o) - ChatGPT 4o
* [Anthropic Claude in Canada](/2024/06/05/anthropic-claude-canada) - Anthropic Claude in Canada
* [LLMs on Android](/2024/07/18/llms-on-android) - AI in your pocket
* [Google Imagen3](/2024/08/28/google-imgen3) - AI Image Generation
* [Google AI Studio](/2024/12/08/google-ai-studio) - AI on Google Cloud
