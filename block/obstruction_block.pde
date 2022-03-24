void obstruction_block() {
  if (hit>=k) { //hitによる
    if (block_x+block_w>=width) {//right
      block_dx=-1;
    } else if (block_x<=0) {//left
      block_dx=1;
    } 
    block_x=block_x+block_dx; //speed

    fill(100, 1, 37);
    rect(block_x, 300, block_w, 12); //おじゃまブロック
  }
}
