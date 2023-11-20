VALID_CHOICES = {
  'r'  => 'rock',
  'p'  => 'paper',
  'sc' => 'scissors',
  'l'  => 'lizard',
  'sp' => 'spock'
}

WINNING_CONDITIONS = {
  'rock'     => ['scissors', 'lizard'],
  'paper'    => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard'   => ['spock', 'paper'],
  'spock'    => ['scissors', 'rock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_player_choice
  loop do
    prompt("Choose one: #{VALID_CHOICES.map { |shorthand, full| "#{shorthand} (for #{full})" }.join(', ')}")
    choice = Kernel.gets.chomp.downcase
    return VALID_CHOICES[choice] if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end
end

def determine_round_winner(player, computer)
  if WINNING_CONDITIONS[player].include?(computer)
    :player
  elsif WINNING_CONDITIONS[computer].include?(player)
    :computer
  else
    :tie
  end
end

def update_score(winner, scores)
  scores[winner] += 1 if winner != :tie
end

def display_choices(player, computer)
  Kernel.puts("You chose: #{player}; Computer chose: #{computer}.")
end

def display_results(winner)
  case winner
  when :player
    prompt("You won!")
  when :computer
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def display_score(scores)
  prompt("The current score is: Player: #{scores[:player]}, Computer: #{scores[:computer]}")
end

def play_round(scores)
  player_choice = get_player_choice
  computer_choice = VALID_CHOICES.values.sample

  display_choices(player_choice, computer_choice)

  winner = determine_round_winner(player_choice, computer_choice)
  display_results(winner)
  update_score(winner, scores)
end

def main_game
  scores = { player: 0, computer: 0 }
  loop do
    play_round(scores)
    display_score(scores)
    break if scores[:player] == 3 || scores[:computer] == 3

    prompt("Do you want to play again?")
    break unless Kernel.gets.chomp.downcase.start_with?('y')
  end
end

main_game
prompt("Thank you for playing!")
