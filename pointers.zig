const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

test "pointer access" {
    const a: i32 = 123;
    const aptr: *const i32 = &a;
    assert(aptr.* == 123);

    var b: i32 = a;
    const bptr: *i32 = &b;
    bptr.* += 10;
    assert(bptr.* == 133);
}
