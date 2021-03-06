local Runner = require("tests.indent.common").Runner
local XFAIL = require("tests.indent.common").XFAIL

local run = Runner:new(it, "tests/indent/rust", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 0,
  expandtab = true,
})

describe("indent Rust:", function()
  describe("whole file:", function()
    run:whole_file(".", {
      expected_failures = {
        "./enum.rs",
        "./func.rs",
        "./array.rs",
        "./where.rs",
        "./trait.rs",
        "./string.rs",
        "./macro.rs",
      },
    })
  end)

  describe("new line:", function()
    run:new_line("array.rs", { on_line = 2, text = "0,", indent = 4 })
    run:new_line("array.rs", { on_line = 8, text = "0,", indent = 8 })
    run:new_line("comment.rs", { on_line = 3, text = "a", indent = "/// " })
    run:new_line("cond.rs", { on_line = 11, text = "x += 1;", indent = 12 })
    run:new_line("cond.rs", { on_line = 2, text = "x += 1;", indent = 8 })
    run:new_line("cond.rs", { on_line = 4, text = "x += 1;", indent = 8 }, "expected_failures", XFAIL)
    run:new_line("cond.rs", { on_line = 6, text = "x += 1;", indent = 8 }, "expected_failures", XFAIL)
    run:new_line("enum.rs", { on_line = 2, text = "Q,", indent = 4 })
    run:new_line("enum.rs", { on_line = 4, text = "i32,", indent = 8 })
    run:new_line("enum.rs", { on_line = 8, text = "z: u32,", indent = 8 })
    run:new_line("func.rs", { on_line = 1, text = "let _x = 1;", indent = 4 })
    run:new_line("func.rs", { on_line = 6, text = "z: i32,", indent = 4 })
    run:new_line("impl.rs", { on_line = 3, text = "const FOO: u32 = 1;", indent = 4 })
    run:new_line("impl.rs", { on_line = 4, text = "let _x = 1;", indent = 8 })
    run:new_line("loop.rs", { on_line = 10, text = "x += 1;", indent = 8 })
    run:new_line("loop.rs", { on_line = 2, text = "x += 1;", indent = 8 })
    run:new_line("loop.rs", { on_line = 6, text = "x += 1;", indent = 8 })
    run:new_line("macro.rs", { on_line = 1, text = "() => {},", indent = 4 })
    run:new_line("macro.rs", { on_line = 12, text = "B C", indent = 4 })
    run:new_line("macro.rs", { on_line = 2, text = "struct $c;", indent = 8 })
    run:new_line("match.rs", { on_line = 2, text = "-1 => -1,", indent = 8 })
    run:new_line("match.rs", { on_line = 7, text = "let y = 1;", indent = 12 })
    run:new_line("mod.rs", { on_line = 1, text = "const Z: i32 = 1;", indent = 4 })
    run:new_line("mod.rs", { on_line = 2, text = "const Z: i32 = 1;", indent = 4 })
    run:new_line("mod.rs", { on_line = 6, text = "const Z: i32 = 1;", indent = 8 })
    run:new_line("string.rs", { on_line = 2, text = "brave new", indent = 0 }, "expected_failures", XFAIL)
    run:new_line("string.rs", { on_line = 5, text = "brave new \\", indent = 8 })
    run:new_line("string.rs", { on_line = 9, text = "brave new \\", indent = 8 })
    run:new_line("struct.rs", { on_line = 1, text = "z: i32,", indent = 4 })
    run:new_line("struct.rs", { on_line = 2, text = "z: i32,", indent = 4 })
    run:new_line("trait.rs", { on_line = 4, text = "fn baz();", indent = 4 })
    run:new_line("trait.rs", { on_line = 7, text = "fn baz();", indent = 4 })
    run:new_line("trait.rs", { on_line = 8, text = "()", indent = 8 })
    run:new_line("where.rs", { on_line = 17, text = "T: Debug,", indent = 4 })
    run:new_line("where.rs", { on_line = 2, text = "T: Debug,", indent = 4 })
    run:new_line("where.rs", { on_line = 9, text = "T: Debug,", indent = 4 })
  end)
end)
