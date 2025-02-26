const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn add(a:u8, b:u8 )usize{
    const result = a + b;
    return &result;
}

pub fn main() !void {
   const r = add(5, 27); _ = r; 
}
