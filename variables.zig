const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

test "simple arithmetic op" {
    const x = 1 + 2 * 3;
    assert(7 == x);
}

test "mutating a variable" {
    var x: i32 = 1;
    x = 2;
    assert(x == 2);
}

test "array of i32" {
    const x = [_]i32{
        10,
        20,
        30,
    };
    var sum: i32 = 0;

    assert(x.len == 3);
    assert(10 == x[0]);
    assert(20 == x[1]);
    assert(30 == x[2]);

    for (x) |v| {
        sum += v;
    }

    assert(60 == sum);
}

test "string literal" {
    const str = "hoge" ** 3;
    assert(mem.eql(u8, str, "hogehogehoge"));
}

test "a fn call" {
    const x = addI32(12, 23);
    assert(35 == x);

    //const y = addStr("hello", "world");
    //assert(mem.eql(u8, y, "hehoge"));
}

fn addI32(a: i32, b: i32) i32 {
    return a + b;
}

//fn addStr(a: [:0]const u8, b: [:0]const u8) []const u8 {
//    // use allocator to alloc memory
//    return "hehoge";
//}

const Point = struct {
    x: i32,
    y: i32,

    pub fn init(x: i32, y: i32) Point {
        return Point{
            .x = x,
            .y = y,
        };
    }

    pub fn double(self: *const Point) Point {
        return Point{
            .x = self.x * 2,
            .y = self.y * 2,
        };
    }
};

test "struct with methods" {
    const p = Point.init(1, 2);
    assert(1 == p.x);
    assert(2 == p.y);

    const p2 = p.double();
    assert(2 == p2.x);
    assert(4 == p2.y);
}
