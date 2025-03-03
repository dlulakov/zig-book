const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // var buffer = try std.ArrayList(u8).initCapacity(allocator, 100);
    // defer buffer.deinit();
    // try buffer.append('H');
    // try buffer.append('e');
    // try buffer.append('l');
    // try buffer.append('l');
    // try buffer.append('0');
    // try buffer.appendSlice(" World ");
    // try stdout.print("buffer {s}", .{buffer.items});

    // 11.1.4
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // var buffer = try std.ArrayList(u8).initCapacity(allocator, 100);
    // defer buffer.deinit();
    //
    // for (0..10) |i| {
    //     const index: u8 = @intCast(i);
    //     try buffer.append(index);
    // }
    //
    // std.debug.print("Before\n", .{});
    // std.debug.print("{any}\n", .{buffer.items});
    // std.debug.print("{any}\n", .{buffer.items.len});
    // std.debug.print("{any}\n", .{buffer.capacity});
    // _ = buffer.orderedRemove(3);
    // _ = buffer.orderedRemove(3);
    //
    // std.debug.print("After\n", .{});
    // std.debug.print("{any}\n", .{buffer.items});
    // std.debug.print("{any}\n", .{buffer.items.len});
    // std.debug.print("{any}\n", .{buffer.capacity});

    // 11.1.5
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // var buffer = try std.ArrayList(u8).initCapacity(allocator, 10);
    // defer buffer.deinit();
    //
    // try buffer.appendSlice("My Pedro");
    // try buffer.insert(4, '3');
    // try buffer.insertSlice(2, " name");
    // for (buffer.items) |char| {
    //     try stdout.print("{c}", .{char});
    // }

    // 11.2.2
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // const AutoHashMap = std.hash_map.AutoHashMap;
    // var hash_table = AutoHashMap(u32, u16).init(allocator);
    // defer hash_table.deinit();
    //
    // try hash_table.put(54321, 89);
    // try hash_table.put(50050, 55);
    // try hash_table.put(57709, 41);
    // std.debug.print("N of values stored: {d}\n", .{hash_table.count()});
    // std.debug.print("Value at key 50050: {d}\n", .{hash_table.get(50050).?});
    //
    // if (hash_table.remove(57709)) {
    //     std.debug.print("Value at key 57709 successfully removed\n", .{});
    // }
    // std.debug.print("N of values stored: {d}\n", .{hash_table.count()});
    //

    // 11.2.3
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // const AutoHashMap = std.hash_map.AutoHashMap;
    // var hash_table = AutoHashMap(u32, u16).init(allocator);
    // defer hash_table.deinit();
    //
    // try hash_table.put(54321, 89);
    // try hash_table.put(50050, 55);
    // try hash_table.put(57709, 41);
    //
    // var it = hash_table.iterator();
    // while (it.next()) |kv| {
    //     std.debug.print("Key: {d} | ", .{kv.key_ptr.*});
    //     std.debug.print("Value: {d}\n", .{kv.value_ptr.*});
    // }
    // 
    // var kit = hash_table.keyIterator();
    // while (kit.next()) |k| {
    //     std.debug.print("Key: {d}\n", .{k.*});
    // }

    // 11.2.4
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var ages = std.StringHashMap(u8).init(allocator);
    defer ages.deinit();
    
    try ages.put("Pedro", 25);
    try ages.put("Matheus", 21);
    try ages.put("Abgail", 42);
    
    var it = ages.iterator();
    while (it.next()) |kv| {
        std.debug.print("Key: {s} | ", .{kv.key_ptr.*});
        std.debug.print("Value: {d}\n", .{kv.value_ptr.*});
    }

}
