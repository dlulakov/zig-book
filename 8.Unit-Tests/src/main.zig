const std = @import("std");
const Allocator = std.mem.Allocator;
const expect = std.testing.expect;
const expectError = std.testing.expectError;
fn some_memory_leak(allocator: Allocator) !void {
    const buffer = try allocator.alloc(u32, 10);
    _ = buffer;
}

fn alloc_error(allocator: Allocator) !void {
    var ibuffer = try allocator.alloc(u8, 100);
    defer allocator.free(ibuffer);
    ibuffer[0] = 2;
}

test "testing error" {
    var buffer: [10]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();
    try expectError(error.OutOfMemory, alloc_error(allocator));
}

// test "values are equal" {
//     const v1 = 15;
//     const v2 = 18;
//     try std.testing.expectEqual(v1, v2);
// }

test "arrays are equal" {
    const arr1 = [3]u8{ 1, 2, 3 };
    const arr2 = [3]u8{ 1, 2, 3 };
    try std.testing.expectEqualSlices(u8, &arr1, &arr2);
}

test "strings are equal" {
    const str1 = "hello, world";
    const str2 = "Hello, world";
    try std.testing.expectEqualStrings(str1, str2);
}
