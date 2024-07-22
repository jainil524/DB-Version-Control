document.getElementById('agree').addEventListener('change', function() {
  document.getElementById('next1').disabled = !this.checked;
});

document.getElementById('next1').addEventListener('click', () => {
  showStep(2);
});

document.getElementById('back2').addEventListener('click', () => {
  showStep(1);
});

document.getElementById('next2').addEventListener('click', () => {
  showStep(3);
});

document.getElementById('back3').addEventListener('click', () => {
  showStep(2);
});

document.getElementById('next3').addEventListener('click', () => {
  showStep(4);
});

document.getElementById('back4').addEventListener('click', () => {
  showStep(3);
});

document.getElementById('privileges-form').addEventListener('submit', (e) => {
  e.preventDefault();
  alert('Installation complete!');
  // You can add logic to perform final actions here
});

document.querySelectorAll('input[name="accessType"]').forEach((elem) => {
  elem.addEventListener('change', function() {
    if (this.value === 'simple') {
      document.getElementById('simple-access').style.display = 'block';
      document.getElementById('custom-access').style.display = 'none';
    } else {
      document.getElementById('simple-access').style.display = 'none';
      document.getElementById('custom-access').style.display = 'block';
    }
  });
});

function showStep(stepNumber) {
  document.querySelectorAll('.step').forEach(step => {
    step.classList.remove('active');
  });
  document.getElementById(`step${stepNumber}`).classList.add('active');
}
