const std = @import("std");
const expect = @import("std").testing.expect;

fn twice(comptime num: u32)u32{
    return num * 2;
}

fn fibonacci(index: u32) u32{
    if (index < 2) return index;
    return fibonacci(index - 1) + fibonacci(index - 2);
}

pub fn main() !void {
    
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
