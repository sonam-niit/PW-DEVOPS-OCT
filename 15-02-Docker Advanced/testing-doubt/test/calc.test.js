const { add, sub, multiply } = require("../calculator")

test('Validate Add method',()=>{
    expect(add(2,3)).toBe(5)
}) 
test('Validate Sub method',()=>{
    expect(sub(2,3)).toBe(-1)
}) 
test('Validate Multiply method',()=>{
    expect(multiply(2,3)).toBe(6)
}) 