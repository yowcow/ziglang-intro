const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

pub const Person = struct {
    id: i32,
    given_name: []const u8,
    family_name: []const u8,

    pub fn init(id: i32, gname: []const u8, fname: []const u8) Person {
        return Person{
            .id = id,
            .given_name = gname,
            .family_name = fname,
        };
    }

    pub fn fullName(self: Person) ![]const u8 {
        const len = self.given_name.len + self.family_name.len + 1;

        // use allocator to alloc memory

        return "to be implemented";
    }
};

test "Person" {
    const ps = [_]Person{
        Person.init(1, "foo", "foo-family"),
        Person.init(2, "bar", "bar-family"),
        Person.init(3, "buz", "buz-family"),
    };

    const name1: []const u8 = ps[0].fullName() catch "";
    const name2: []const u8 = ps[1].fullName() catch "";

    assert(ps[0].id == 1);
    //assert(mem.eql(u8, name1, "foo foo-family"));

    assert(ps[1].id == 2);
    //assert(mem.eql(u8, ps[1].fullName() catch "", "bar bar-family"));
}

pub const Point = struct {
    x: i32 = 10,
    y: i32 = 20,

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

    // can be called only on mutable pointer
    pub fn doubleUpdate(self: *Point) bool {
        self.x *= 2;
        self.y *= 2;
        return true;
    }
};
