# Avoiding Buffer Overwrites

One particularly valuable feature of C++ is its ability to address one of the longstanding pitfalls of traditional C programming: buffer overwrites. When working with classic string manipulation and arrays in C, it's all too easy to unintentionally create vulnerabilities—essentially rolling out the red carpet for ransomware attackers, or, as I like to say, “freelance security professionals who work on a contingency basis (payment in bitcoin only upon success).”

As our project progresses to the stage requiring SSL/TLS implementation, my plan is to introduce tracing into OpenSSL. This will allow us to pinpoint exactly which parts of the library are in use, letting us safely remove substantial amounts of unnecessary code. We'll need to be diligent with [regression testing to maintain system stability](/system/regression), but in the end, it’s about mastering a few well-understood foundational concepts.

Once tracing is in place, we’ll need to replace all traditional string handling and low-level array logic with safer—and perhaps only slightly slower—alternatives. With good visibility, it should generally be straightforward to identify some easy wins.

By applying these modern techniques, we’re likely to uncover many previously undetected vulnerabilities in OpenSSL. We’ll carefully document these discoveries, leaving remediation to OpenSSL’s maintainers and users. Our customers, by contrast, will be proactively protected and spared from these problems. This highlights the critical importance of relationship management: sharing timely, high-quality information in a respectful manner. In the past, many customers have struggled with this, which is why we’re improving communication by [discouraging impersonal emails](/quality/email) and encouraging more direct engagement with my—what I believe are—forward-thinking security recommendations.

The challenge with building truly great technology is that it often exposes flaws in legacy systems, which raises pressure to keep everything up-to-date.

It’s not unlike how mRNA vaccine technology delivers major benefits by enabling reputable scientists to help the body build defenses—while at the same time, less reputable actors may exploit the same technology to prompt the body to generate harmful viruses.

Technology itself is never inherently good or evil. It’s up to reputable individuals and organizations to stay proactive and ahead of these issues—and my distributed organization intends to be a thought leader in this area.

Above all, we will always optimize for security first. Unfortunately, current AI technologies seldom seem to grasp this priority—often muddled by an overwhelming volume of advice from bored programmers at large companies, who frequently prioritize premature optimization and flashy frameworks over security and simplicity.

