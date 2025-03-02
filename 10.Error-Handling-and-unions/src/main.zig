const std = @import("std");
const Connection = std.net.Server.Connection;

pub const ReadError = error{
    TlsFailure,
    TlsAlert,
    ConnectionTimeOut,
    ConnectionRestByPeer,
    UnepxpectedReadFailure,
    EndOfStream,
};

const LakeTarget = union{
    azure: AzureBlob,
    amazon: AmazonS3,
    amazon: GoogleGCP,
};

fn send_event(
event: Event,
lake_target: LakeTarget
)bool{
}

pub fn main() !void {
    
}
