const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn();

pub fn main() !void {
    // This is the General Purpose Alloctor
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // const some_number = try allocator.create(u32);
    // defer allocator.destroy(some_number);
    // some_number.* = @as(u32, 45);
      
    // FixedBufferAllocator Stack
    // var buffer: [10]u8 = undefined;
    // for (0..buffer.len) |i| {
    //     buffer[i] = 0;
    // }
    //
    // var fba = std.heap.FixedBufferAllocator.init(&buffer);
    // const allocator = fba.allocator();
    // const input = allocator.alloc(u8, 5);
    // defer allocator.destroy(input);
    
    // FixedBufferAllocator Heap

    // const heap = std.heap.page_allocator;
    // const memory_buffer = try heap.alloc(u8, 100 * 1024 * 1024);
    // defer heap.free(memory_buffer);
    // var fba = std.heap.FixedBufferAllocator.init(memory_buffer);
    // const allocator = fba.allocator();
    // const input = try allocator.alloc(u8, 100);
    // defer allocator.free(input);

    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // var aa = std.heap.ArenaAllocator.init(gpa.allocator());
    // defer aa.deinit();
    // const allocator = aa.allocator();
    // 
    // const in1 = try allocator.alloc(u8, 5);
    // const in2 = try allocator.alloc(u8, 10);
    // const in3 = try allocator.alloc(u8, 15);
    // _ = in1;
    // _ = in2;
    // _ = in3;
    
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var input = try allocator.alloc(u8, 50);
    defer allocator.free(input);
    for (0..input.len) |i| {
        input[i] = 0;
    }
    const input_reader = stdin.reader();
    _ = try input_reader.readUntilDelimiterOrEof(input, '\n');
    std.debug.print("{s}\n", .{input});


}
