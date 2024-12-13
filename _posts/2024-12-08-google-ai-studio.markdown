---
layout: post
title: Google AI Studio
subtitle: trying some prompts
date: 2024-12-08
background: /img/headers/maui_lava_rock.jpg
comments: true
published: true
---

After I completed a [5-day course](https://rsvp.withgoogle.com/events/google-generative-ai-intensive) last month covering Google's current AI offerings, I wanted to play around in the [Google AI Studio](https://aistudio.google.com/) a bit more. In particular, I wanted to check out the Gemini LLM via some prompts.  Initially, I used the Gemini v1.5 Flash model.

## Gemini v1.5 Sample Prompts

Here's an example prompt in the Studio, asking about plantcare based on a photo input.  

<img src="/img/posts/google-ai-studio-plantcare.png" class="img-fluid" />

Along the right side of the studio window, the model's inputs can be tweaked.  For example, the creativity of the response is affected by changing the 'Temperature' value.

The Prompt Gallery had some other interesting prompts, including one showing structured text output:

<img src="/img/posts/google-ai-studio-structured-trip.png" class="img-fluid" />

After my [tests of OCR a few years ago](/2018/03/06/tabular_ocr_gcv), I found the pasted letter image, responded to by Santa Claus an impressive feat:

<img src="/img/posts/google-ai-studio-santa-claus.png" class="img-fluid" />


## Gemini v2.0 Sample Prompts

A few days after I posted above using Gemini v1.5, Google [annouced Gemini v2.0](https://blog.google/technology/google-deepmind/google-gemini-ai-update-december-2024) and made it available to test within Google AI Studio.  So, I went back and tried out the same sample prompts.

Interestingly, using the Gemini 2.0 Flash experimental model, providing the same input photo and prompt as before.

<img src="/img/posts/google-ai-studio-plantcare-v2.png" class="img-fluid" />

 I was told it was a different plant than Gemini v1.5 labelled.  As I am not a botanist or florist, I actually don't know which (if either) model labelling is correct.  This is a good example of non-experts being convinced of LLM output, even when it may be plain wrong.  

Gemini v1.5 and v2.0 both handled the structured output task for trip recommendations nearly identically.

The letter from Santa to Emma, seemed to have a little more *heart* using the Gemini v2.0 model:

<img src="/img/posts/google-ai-studio-santa-claus-v2.png" class="img-fluid" />

P.S. For those interested, the 5-day course I took is now available as a [Learning Guide](https://www.kaggle.com/learn-guide/5-day-genai) so don't feel left out if you missed it first time.

### More in this series...
* [Google Gemini](/2024/02/16/google-gemini) - Google Gemini
* [Anthropic Claude](/2024/03/04/anthropic-claude) - Anthropic Claude
* [Llama 3](/2024/04/19/llama-3) - Llama 3
* [ChatGPT 4o](/2024/05/21/chatgpt-4o) - ChatGPT 4o
* [Anthropic Claude in Canada](/2024/06/05/anthropic-claude-canada) - Claude eh?
* [LLMs on Android](/2024/07/18/llms-on-android) - AI in your pocket
* [Google Imagen3](/2024/08/28/google-imgen3) - AI Image Generation
* [Azure AI Studio](/2024/09/30/azure-ai-studio) - AI on MS Azure
