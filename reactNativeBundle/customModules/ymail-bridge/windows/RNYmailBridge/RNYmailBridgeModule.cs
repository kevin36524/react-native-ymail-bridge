using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Ymail.Bridge.RNYmailBridge
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNYmailBridgeModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNYmailBridgeModule"/>.
        /// </summary>
        internal RNYmailBridgeModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNYmailBridge";
            }
        }
    }
}
