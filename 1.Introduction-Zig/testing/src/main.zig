const std = @import("std");
pub fn main() !void {
    const simple_array = [_]i32{1, 2, 3, 4};
    const string_obj: []const u8 = "A string object";
    std.debug.print(
        "Type 1: {}\n", .{@TypeOf(simple_array)}
    );
    std.debug.print(
        "Type 2: {}\n", .{@TypeOf("A string literal")}
    );
    std.debug.print(
        "Type 3: {}\n", .{@TypeOf(&simple_array)}
    );
    std.debug.print(
        "Type 4: {}\n", .{@TypeOf(string_obj)}
    );
}
