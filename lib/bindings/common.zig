pub extern fn jsFree (ptr: u32) void;
pub extern fn jsResolve(ctx: u32, response: u32) void;
pub extern fn jsSize (ptr: u32) u32;
pub extern fn jsToBytes (ptr: u32) [*]u8;
pub extern fn jsToBuffer (ptr: [*]const u8, len: usize) u32;
pub extern fn jsCreateClass (classPos: u8, argsPtr: u32) u32;
pub extern fn jsEqual (aPtr: u8, bPtr: u32) u32; 
pub fn equal (aPtr: *u8, bPtr: *u32) bool {
    const res = jsEqual(aPtr.*, bPtr.*);
    return (res == True);
}
pub extern fn jsDeepEqual (aPtr: u8, bPtr: u32) u32; 
pub fn deepEqual (aPtr: *u8, bPtr: *u32) bool {
    const res = jsDeepEqual(aPtr.*, bPtr.*);
    return (res == True);
}
pub extern fn jsInstanceOf (classPos: u8, classPrt: u32) u32; 
pub fn instanceOf (classPos: *u8, classPrt: *u32) bool {
    const res = jsInstanceOf(classPos.*, classPrt.*);
    return (res == True);
}

pub const Null: u32 = 1;
pub const Undefined: u32 = 2;
pub const True: u32 = 3;
pub const False: u32 = 4;
pub const Infinity: u32 = 5;
pub const NaN: u32 = 6;
pub const DefaultValueSize = 6;

pub const Classes = enum(u8) {
  Array = 0,
  Object,
  Map,
  Set,
  WeakMap,
  WeakSet,
  Uint8Array,
  ArrayBuffer,
  SharedArrayBuffer,
  DataView,
  Request,
  Response,
  Headers,
  FormData,
  File,
  Blob,
  URL,
  URLPattern,
  URLSearchParams,
  ReadableStream,
  WritableStream,
  TransformStream,
  CompressionStream,
  DecompressionStream,
  DigestStream,
  FixedLengthStream,
  WebSocketPair,

  pub fn toInt (self: *const Classes) u8 {
    return @enumToInt(self.*);
  }
};

pub const JSValue = struct {
  id: u32,

  pub fn init (ptr: u32) JSValue {
    return JSValue{ .id = ptr };
  }

  pub fn free (self: *const JSValue) void {
    jsFree(self.id);
  }
};

pub fn toJSBool (b: bool) u32 {
  if (b) {
    return True;
  } else {
    return False;
  }
}