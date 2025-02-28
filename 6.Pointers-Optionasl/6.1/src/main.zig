const std = @import("std");
const stdout = std.io.getStdOut().writer();

const User = struct {
    id: u64,
    name: []const u8,
    email: []const u8,

    pub fn init(id: u64,
                name: []const u8,
                email: []const u8) User {

        return User {
            .id = id,
            .name = name,
            .email = email
        };
    }

    pub fn print_name(self: User) !void {
        try stdout.print("{s}\n", .{self.name});
    }

}; 

pub fn main() !void {
    // var number: u8 = 5;
    // const pointer = &number;
    // const double = pointer.* * 2;
    // pointer.* = pointer.* + 100;
    // try stdout.print("Double: {d}\n", .{double});
    // try stdout.print("Number: {d}\n", .{number});
    
    // const u = User.init(1, "dame", "d.lulakov@gmail.com");
    // const pointer = &u;
    // try pointer.*.print_name();
    
    // var number: u8 = 5;
    // try stdout.print("Number: {d}\n", .{number});
    // const pointer = &number;
    // pointer.* = 6;
    //
    // try stdout.print("Number: {d}\n", .{number});
    //
    
    // const c1: u8 = 5;
    // const c2: u8 = 6;
    // var pointer = &c1;
    // try stdout.print("{d}\n", .{pointer.*});
    // pointer = &c2;
    // try stdout.print("{d}\n", .{pointer.*});

    // var ar = [4]i32 {1, 2, 3, 4};
    // var ptr: [*]const i32 = &ar;
    // try stdout.print("{d}\n", .{ptr[0]});
    // ptr += 1;
    // try stdout.print("{d}\n", .{ptr[0]});
    // ptr += 1;
    // try stdout.print("{d}\n", .{ptr[0]});

    const ar = [_]i32{1, 2, 3, 4};
    const s1 = ar[0..ar.len];
    _ = s1;

}
