const std = @import("std");

pub const Rotation = struct {
    direction: Direction,
    degrees: i32,

    const Direction = enum { left, right };

    pub fn init(instruction: []const u8) !Rotation {
        const direction = if (instruction[0] == 'L') Direction.left else Direction.right;
        const deg: i32 = try std.fmt.parseInt(i32, instruction[1..instruction.len], 10);
        return .{ .direction = direction, .degrees = deg };
    }

    pub fn rotate(rotation: Rotation, pos: i32, counter: *i32) i32 {
        switch (rotation.direction) {
            .left => {
                std.debug.print("L{d}\n", .{rotation.degrees});
                return rotateLeft(pos, rotation.degrees, counter);
            },
            .right => {
                std.debug.print("R{d}\n", .{rotation.degrees});
                return rotateRight(pos, rotation.degrees, counter);
            },
        }
    }

    fn rotateLeft(pos: i32, deg: i32, counter: *i32) i32 {
        const mod_deg = @mod(deg, 100);
        counter.* += @divTrunc(deg, 100);
        const result = pos - mod_deg;
        if (result < 0) {
            if (pos != 0){
                counter.* += 1;
            }
            return result + 100;
        } else {
            return result;
        }
    }

    fn rotateRight(pos: i32, deg: i32, counter: *i32) i32 {
        const mod_deg = @mod(deg,100);
        counter.* += @divTrunc(deg, 100);
        const result = pos + mod_deg;
        if(result>=100){ 
            if (result > 100){
                counter.* += 1;
            }
            return result - 100; 
        }else { 
            return result;
        }
    }
};
