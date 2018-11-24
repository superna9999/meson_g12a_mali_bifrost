/*
 * Contains workarounds needed to get this to compile against an upstream
 * kernel. Mainly, this just means defining deprecated macros when needed.
 *
 */
#ifndef _PANFROST_UPSTREAM_WORKAROUNDS_
#define _PANFROST_UPSTREAM_WORKAROUNDS_

#ifndef __asmeq
#define __asmeq(x, y)  ".ifnc " x "," y " ; .err ; .endif\n\t"
#endif

#endif /* _PANFROST_UPSTREAM_WORKAROUNDS_ */
