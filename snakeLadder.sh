playerOne=1
playerTwo=2
playerOnePos=0
playerTwoPos=0
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
while [ $playerOnePos -ne 100 -o $playerTwoPos -ne 100 ]
do
  echo 'Player 1 turn'
  rollDie $playerOnePos
  playerOnePos=$?
  echo "player one position ${playerOnePos}"
  echo 'Player 2 turn'
  rollDie $playerTwoPos
  playerTwoPos=$?
  echo "player two position ${playerTwoPos}"
done
if [ $playerOnePos -eq 100 ]; then
  echo 'Player 1 won'
else
  echo 'Player 2 won'
fi
echo "Total Number of times dice rolled ${diceCount}"