/** @file
 * @brief wolfSSL initialization
 *
 * Initialize the wolfSSL library.
 */

#include <init.h>

#include "user_settings.h"

#if defined(CONFIG_WOLFSSL)
#if !defined(CONFIG_WOLFSSL_OPTIONS_FILE)
#include "wolfssl/options.h"
#else
#include CONFIG_WOLFSSL_OPTIONS_FILE
#endif /* CONFIG_WOLFSSL_OPTIONS_FILE */
#endif

#include "wolfssl/ssl.h"

static int _wolfssl_init(struct device *device)
{
    ARG_UNUSED(device);

    return 0;
}

SYS_INIT(_wolfssl_init, POST_KERNEL, 0);
