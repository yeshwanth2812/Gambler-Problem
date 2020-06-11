playerPos=0
rollDie() {
  dieValue=$(( $((RANDOM % 6)) + 1 ))
  echo "Die value ${dieValue}"
}
while [ $playerPos -ne 100 ]
do
  option=$((RANDOM % 3))
  case $option in
    0)  echo "No Play" ;;
    1)  rollDie
        playerPos=$((playerPos + dieValue))
        echo 'player got a ladder'
        echo "player position is ${playerPos}";;
    2)  rollDie
        playerPos=$((playerPos - dieValue))
        if [ $playerPos -lt 0 ]; then
          playerPos=0
        fi
        echo 'player got a snake'
        echo "player position is ${playerPos}" ;;
  esac
done
echo 'player won'