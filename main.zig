const std = @import("std");

pub fn main() !void {
    try printWriter(std.io.getStdOut(), "STDOUT");
    try printWriter(std.io.getStdErr(), "STDERR");
}

fn printWriter(f: std.fs.File, name: [:0]const u8) !void {
    try f.writer().print("Hello, {}!\n", .{name});
}
