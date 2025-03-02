const std = @import("std");
const SocketConf = @import("config.zig");
const Request = @import("request.zig");
const Response = @import("response.zig");
const stdout = std.io.getStdOut().writer();

const Map = std.static_string_map.StaticStringMap;
const MethodMap = Map(Method).initComptime(.{
    .{"GET", Method.GET},
    .{"POST", Method.POST},
    .{"PUT", Method.PUT},
    .{"PATCH", Method.PATCH},
    .{"DELETE", Method.DELETE},
    .{"OPTION", Method.OPTION},
});

pub const Method = enum {
    GET,
    POST,
    DELETE,
    PUT,
    OPTION,
    PATCH,
    pub fn init(text: []const u8) !Method{
        return MethodMap.get(text).?;
    }
    pub fn is_supported(m: []const u8) bool{
        const method = MethodMap.get(m);
        if (method) {
            return true;
        }
        return false;
    }
};

pub fn main() !void {
    const socket = try SocketConf.Socket.init();
    try stdout.print("Server Addr: {any}\n", .{socket._address});
    var server = try socket._address.listen(.{});
    const conneciton = try server.accept();

    var buffer: [1000]u8 = undefined;
    for (0..buffer.len) |i| {
        buffer[i] = 0;
    }

    //Reading and Parsing the request
    try Request.read_request(conneciton, buffer[0..buffer.len]);
    const requst = Request.parse_request(buffer[0..buffer.len]);
    try stdout.print("{any}\n", .{requst});

    // Creating and returning the response
    if (requst.method == Method.GET) {
        if (std.mem.eql(u8, requst.uri, "/")) {
            try Response.send200(conneciton);
        }else {
            try Response.send_404(conneciton);
        }
    }

}
