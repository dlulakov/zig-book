const std = @import("std");
const stdout = std.io.getStdOut().writer(); 

fn add_and_increment(x: u8, y: u8) u8{
    const sum = x + y;
    const increment = sum + 1;
    return increment;
}

pub fn main() !void {
    var n = add_and_increment(2, 3);
    n = add_and_increment(n, n);
    try stdout.print("result: {d}!\n", .{n});
}
