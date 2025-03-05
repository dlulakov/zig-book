const std = @import("std");
const expect = @import("std").testing.expect;

fn twice(comptime num: u32)u32{
    return num * 2;
}

fn max(comptime T: type, a: T, b: T) T{
    return if (a > b) a else b;

}

fn fibonacci(index: u32) u32{
    if (index < 2) return index;
    return fibonacci(index - 1) + fibonacci(index - 2);
}

pub fn main() !void {
    
}

test "test max" {
    const n1 = max(u8, 4, 10);
    std.debug.print("Max n1: {d}\n", .{n1});
    const n2 = max(f64, 89.23, 64.10);
    std.debug.print("Max n2: {d}\n", .{n2});
}

test "fibonacci"{
    try expect(fibonacci(7) == 13);
    try comptime expect(fibonacci(7) == 13);
}

test "fibonacci in a block"{
    const x = comptime blk: {
        const n1 = 5;
        const n2 = 2;
        const n3 = n1 + n2;
        try expect(fibonacci(n3) == 13);
        break :blk n3;
    };
    _ = x;
}

test "test comptime"{
    _ = twice(5);
}
