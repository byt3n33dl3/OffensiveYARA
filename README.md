## Weaponizing YARA

As we all know **YARA** ( language ) is a big thing in cyber security industry, it could be used as a tool for both side of the team.
In here maybe a ( project ) from an attackers perspective: 
> - Quality Assurance: Malware developers can use YARA to ensure their creations are not inadvertently detected by publicly available rules before deployment.
> - Code Reuse Identification: Identifying reused code snippets from known malware to leverage existing techniques while avoiding detection.

from a **deffensive** role perspective:
We develop rules for new threats, and after their quality has been proven through testing in our cloud and other environments.
These rules have been written by our `threat` analysts, for threat hunters, incident responders, security analysts, and other defenders that could benefit from deploying high-quality threat detection YARA rules in their environment.

Our detection rules, as opposed to hunting rules, need to satisfy certain criteria to be eligible for deployment, namely:
* be as precise as possible, without losing detection quality
* aim to provide zero false-positive detections

In order for the `rules` to be easy to understand and maintain, we adopted the following set of goals:
> - clearly named byte patterns
- readable and transparent conditions
- match unique malware functionality
- prefer code byte patterns over strings

To ensure the quality of our rules, we continuously and extensively test them in our cloud, on over 10B (and rising) unique binaries. Rules are evaluated on every layer to detect threats within layered objects, such as packed PE files, documents, and archives, among other things.

## Prerequisites
To successfully run the entire YARA rule set, you must have:
* YARA version :: 3.2.0
* PE and ELF modules enabled

contributors of this OffensiveYARA:

[![](https://avatars.githubusercontent.com/u/1922788?s=50&v=4)](https://github.com/tpericin)
[![](https://avatars.githubusercontent.com/u/2851492?s=50&v=4)](https://github.com/Neo23x0)
[![](https://avatars.githubusercontent.com/u/182937?s=50&v=4)](https://github.com/plusvic)
[![](https://avatars.githubusercontent.com/u/24500615?s=50&v=4)](https://github.com/xbabka01)

## Originally
- [reversinglabs](https://github.com/reversinglabs/reversinglabs-yara-rules)
