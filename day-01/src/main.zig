const std = @import("std");

const rot = @import("day_01").Rotation;

pub fn main() !void {
    var gpa: std.heap.DebugAllocator(.{}) = .init;

    const allocator = gpa.allocator();

    var rotations: std.ArrayList(rot) = .empty;
    defer rotations.deinit(allocator);

    var cwd = std.fs.cwd();
    var file = try cwd.openFile("input", .{});
    defer file.close();

    var buf: [5]u8 = undefined;
    var reader_wrapper = file.reader(&buf);
    const reader = &reader_wrapper.interface;

    while (try reader.takeDelimiter('\n')) |line| {
        try rotations.append(allocator, try rot.init(line));
    } 
    var pos: i32 = 50;
    var counter: i32 = 0;
    for (rotations.items) |rotation| {
        std.debug.print("Current pos: {d}\n", .{pos});
        pos = rotation.rotate(pos);
        if (pos == 0)
            counter += 1;
    }
    std.debug.print("Result {d}\n", .{counter});
}
