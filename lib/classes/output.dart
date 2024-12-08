class Output {
  //Bisection Constructor
  late double f0, f1, a, b, p0, g0;
  Output(this.a, this.b, this.f0, this.f1) {}
  Output.newton(this.p0, this.f0, this.g0);
  Output.fixed(this.a, this.b);
}
