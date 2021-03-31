/*
 * Auto-generated by Frida. Please modify to match the signature of CC_MD5.
 * This stub is currently auto-generated from manpages when available.
 *
 * For full API reference, see: http://www.frida.re/docs/javascript-api/
 */

{
  /**
   * Called synchronously when about to call CC_MD5.
   *
   * @this {object} - Object allowing you to store state for use in onLeave.
   * @param {function} log - Call this function with a string to be presented to the user.
   * @param {array} args - Function arguments represented as an array of NativePointer objects.
   * For example use args[0].readUtf8String() if the first argument is a pointer to a C string encoded as UTF-8.
   * It is also possible to modify arguments by assigning a NativePointer object to an element of this array.
   * @param {object} state - Object allowing you to keep state across function calls.
   * Only one JavaScript function will execute at a time, so do not worry about race-conditions.
   * However, do not use this to store function arguments across onEnter/onLeave, but instead
   * use "this" which is an object for keeping state local to an invocation.
   */
onEnter: function (log, args, state) {
    //将md5参数转换成字符串并打印
    var md5_data = args[0].readUtf8String();
    if (md5_data == "MGCopyAnswerapple-internal-install") {
        console.log("MD5 - 参数值: 系统函数过滤");
        return;
    }
    if (md5_data == "MGCopyAnswerProductVersion") {
        console.log("MD5 - 参数值: 系统函数过滤");
        return;
    }
    console.log("MD5 - 参数值:");
    console.error(md5_data);
},

  /**
   * Called synchronously when about to return from CC_MD5.
   *
   * See onEnter for details.
   *
   * @this {object} - Object allowing you to access state stored in onEnter.
   * @param {function} log - Call this function with a string to be presented to the user.
   * @param {NativePointer} retval - Return value represented as a NativePointer object.
   * @param {object} state - Object allowing you to keep state across function calls.
   */
onLeave: function (log, retval, state) {
    //将md5返回值转码为32位字符串并打印
    var md5_digest = hexdump(retval , {length: 16})
    var hexified = "";
    var raw_array = md5_digest.split("\n");
    for (var a = 0; a < raw_array.length; a++) {
        var line_array = raw_array[a].split(" ");
        for (var b = 1; b < line_array.length - 1 ; b++) {
            if (line_array[b].length === 2) {
                hexified += line_array[b];
                hexified = hexified.trim()
            }
        }
        
    };
    console.log("MD5 - 返回值:");
    console.error(hexified + "\n");
}
}