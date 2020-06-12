player_One_Pos=0
player_Two_Pos=0
diceCount=0
rollDie() {
  playerPos=$1
  diceCount=$((diceCount + 1))
  dieValue=$(( $((RANDOM % 6)) + 1 ))
  echo "Die value ${dieValue}"
  option=$((RANDOM % 3))
  case $option in
    0)  echo "No Play" ;;
    1)  echo 'player got a ladder'
        if [ $((playerPos + dieValue)) -gt 100 ]; then
          echo 'Player got a value greater than 100 so stays in the same position'
        else
          playerPos=$((playerPos + dieValue))
        fi ;;
    2)  echo 'player got a snake'
        if [ $((playerPos - dieValue)) -lt 0 ]; then
          echo 'Player got a value less than 0 so stays in the same position'
        else
          playerPos=$((playerPos - dieValue))
        fi ;;
  esac
  return $playerPos
}
startGame() {
  while [ $player_One_Pos -ne 100 -a $player_Two_Pos -ne 100 ]
  do
    echo 'Player 1 turn'
    rollDie $player_One_Pos
    player_One_Pos=$?
    echo "player one position ${player_One_Pos}"
    echo 'Player 2 turn'
    rollDie $player_Two_Pos
    player_Two_Pos=$?
    echo "player two position ${player_Two_Pos}"
  done
  if [ $player_One_Pos -eq 100 ]; then
    echo 'Player 1 won'
  else
    echo 'Player 2 won'
  fi
  echo "Total Number of times dice rolled ${diceCount}"
}
startGame